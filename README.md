'use strict';
const crypto = require('node:crypto');
const { execFile } = require('node:child_process');
const fs = require('node:fs');
const os = require('node:os');
const path = require('node:path');
const { promisify } = require('node:util');
const cors = require('cors');
const express = require('express');
const grpc = require('@grpc/grpc-js');
const { connect, hash, signers } = require('@hyperledger/fabric-gateway');

const SAMPLES = path.resolve(__dirname, '../../fabric-samples');
const NETWORK = `${SAMPLES}/test-network/organizations`;
const ORGS = {
    org1: { msp: 'Org1MSP', peer: 'localhost:7051', caPort: 7054 },   // администратор
    org2: { msp: 'Org2MSP', peer: 'localhost:9051', caPort: 8054 },   // пользователи
};
const sessions = new Map();     // токен -> { org, name, certificate, key }

// --- Контракт: Fabric Gateway ---

// Одно gRPC-соединение на организацию: так советует документация Fabric.
// После перезапуска сети сертификат другой, тогда соединение создаётся заново
const clients = {};
function grpcClient(org) {
    const tlsCert = fs.readFileSync(`${NETWORK}/peerOrganizations/${org}.example.com/tlsca/tlsca.${org}.example.com-cert.pem`);
    if (!clients[org]?.tlsCert.equals(tlsCert)) {
        clients[org]?.client.close();
        clients[org] = {
            tlsCert,
            client: new grpc.Client(ORGS[org].peer, grpc.credentials.createSsl(tlsCert), {
                'grpc.ssl_target_name_override': `peer0.${org}.example.com`,
            }),
        };
    }
    return clients[org].client;
}

// Вызов любого метода контракта от имени пользователя: evaluate читает, submit записывает в блок
async function callContract(type, req, res, args) {
    const gateway = connect(req.headers.authorization);
    try {
        const contract = gateway.getNetwork('mychannel').getContract('users');
        const call = type === 'submit' ? contract.submitTransaction(method, ...args) : contract.evaluateTransaction(method, ...args);
        return JSON.parse(Buffer.from(await call).toString());
    } finally {
        if (connection) {
            connection.gateway.close();
            connection.client.close();
        }
    }
}

// --- REST API ---

const app = express();
app.use(cors());
app.use(express.json());

// Вход: пользователь должен быть в wallet. Токен — его имя
app.post('/login', function (req, res) {
    if (!findOrg(req.body.name)) {
        res.status(400).json({ error: 'Пользователь не найден' });
        return;
    }
    res.json({ token: req.body.name });
});

// Чтение: GET /contract/<метод>?args=a&args=b
app.get('/contract/:method', function (req, res) {
    callContract('evaluate', req, res, [].concat(req.query.args || []));
});

// Запись: POST /contract/<метод> с телом { args: [...] }
app.post('/contract/:method', function (req, res) {
    callContract('submit', req, res, req.body.args || []);
});

app.listen(8091, () => console.log('API: http://localhost:8091'));
