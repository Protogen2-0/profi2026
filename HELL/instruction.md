1) создаем папку проекта
```
mkdir -p projects/hl-project 
```
2) переходим в нее
```
cd projects/hl-project 
```
3) скачиваем images для докера
```
docker pull ghcr.io/hyperledger/fabric-rest-sample:latest 
```
с выводом:
```
Digest: sha256:48a5f94794c724340d56c11f0072842d8434bfa4f524e7e9ef352cd4936af831
Status: Downloaded newer image for ghcr.io/hyperledger/fabric-rest-sample:latest
ghcr.io/hyperledger/fabric-rest-sample:latest
```
4) скачиваем установщик для тестового решения
```
curl -sSLO https://raw.githubusercontent.com/hyperledger/fabric/main/scripts/install-fabric.sh 
```
5) выдаем права для запуска
```
chmod +x install-fabric.sh 
```
6) запускаем
```
./install-fabric.sh 
```
в конце вывод:
```
===> List out hyperledger images
ghcr.io/hyperledger/fabric-baseos:2.5.16        109b4a15b282        257MB         83.2MB
ghcr.io/hyperledger/fabric-ca:1.5.17            453a0a727e82        381MB          123MB
ghcr.io/hyperledger/fabric-ccenv:2.5.16         807493f095f6       1.01GB          257MB
ghcr.io/hyperledger/fabric-orderer:2.5.16       1d918fc7e1e0        182MB         50.7MB
ghcr.io/hyperledger/fabric-peer:2.5.16          58979b65744b        232MB         66.8MB
ghcr.io/hyperledger/fabric-rest-sample:latest   48a5f94794c7        306MB         67.7MB
hyperledger/fabric-baseos:2.5                   109b4a15b282        257MB         83.2MB
hyperledger/fabric-baseos:2.5.16                109b4a15b282        257MB         83.2MB
hyperledger/fabric-baseos:latest                109b4a15b282        257MB         83.2MB
hyperledger/fabric-ca:1.5                       453a0a727e82        381MB          123MB
hyperledger/fabric-ca:1.5.17                    453a0a727e82        381MB          123MB
hyperledger/fabric-ca:latest                    453a0a727e82        381MB          123MB
hyperledger/fabric-ccenv:2.5                    807493f095f6       1.01GB          257MB
hyperledger/fabric-ccenv:2.5.16                 807493f095f6       1.01GB          257MB
hyperledger/fabric-ccenv:latest                 807493f095f6       1.01GB          257MB
hyperledger/fabric-orderer:2.5                  1d918fc7e1e0        182MB         50.7MB
hyperledger/fabric-orderer:2.5.16               1d918fc7e1e0        182MB         50.7MB
hyperledger/fabric-orderer:latest               1d918fc7e1e0        182MB         50.7MB
hyperledger/fabric-peer:2.5                     58979b65744b        232MB         66.8MB
hyperledger/fabric-peer:2.5.16                  58979b65744b        232MB         66.8MB
hyperledger/fabric-peer:latest                  58979b65744b        232MB         66.8MB
```
7) переходим в папку сети
```
cd fabric-samples/test-network 
```
8) запускаем сеть и создаем канал blockchain2024
```
./network.sh up createChannel -c blockchain2024 -ca -s couchdb 
```
вывод в конце:
```
Anchor peer set for org 'Org2MSP' on channel 'blockchain2024'
Channel 'blockchain2024' joined
```
9) установка модулей в контракте(chaincode)
```
cd ../asset-transfer-basic/chaincode-javascript
```
```
npm i 
```
```
cd ../../test-network 
```
10) деплой chaincode в канал
```
./network.sh deployCC -ccn Cars -ccl javascript -ccp ../asset-transfer-basic/chaincode-javascript -c blockchain2024 -cci InitLedger 
```
вывод в конце:
```
Invoke transaction successful on peer0.org1 peer0.org2 on channel 'blockchain2024'
```

ошибка с сайта:
```
chunk-I4MZPW7S.js?v=815de7c3:8 Download the React DevTools for a better development experience: https://reactjs.org/link/react-devtools
deprecations.ts:9 ⚠️ React Router Future Flag Warning: React Router will begin wrapping state updates in `React.startTransition` in v7. You can use the `v7_startTransition` future flag to opt-in early. For more information, see https://reactrouter.com/v6/upgrading/future#v7_starttransition.
warnOnce @ deprecations.ts:9
logDeprecation @ deprecations.ts:14
logV6DeprecationWarnings @ deprecations.ts:26
(anonymous) @ index.tsx:816
commitHookEffectListMount @ react-dom.development.js:23189
commitPassiveMountOnFiber @ react-dom.development.js:24965
commitPassiveMountEffects_complete @ react-dom.development.js:24930
commitPassiveMountEffects_begin @ react-dom.development.js:24917
commitPassiveMountEffects @ react-dom.development.js:24905
flushPassiveEffectsImpl @ react-dom.development.js:27078
flushPassiveEffects @ react-dom.development.js:27023
(anonymous) @ react-dom.development.js:26808
workLoop @ scheduler.development.js:266
flushWork @ scheduler.development.js:239
(anonymous) @ scheduler.development.js:533
postMessage
(anonymous) @ scheduler.development.js:574
requestHostCallback @ scheduler.development.js:588
unstable_scheduleCallback @ scheduler.development.js:441
scheduleCallback$1 @ react-dom.development.js:27576
ensureRootIsScheduled @ react-dom.development.js:25722
scheduleUpdateOnFiber @ react-dom.development.js:25570
updateContainer @ react-dom.development.js:28897
(anonymous) @ react-dom.development.js:29353
(anonymous) @ main.jsx:6
deprecations.ts:9 ⚠️ React Router Future Flag Warning: Relative route resolution within Splat routes is changing in v7. You can use the `v7_relativeSplatPath` future flag to opt-in early. For more information, see https://reactrouter.com/v6/upgrading/future#v7_relativesplatpath.
warnOnce @ deprecations.ts:9
logDeprecation @ deprecations.ts:14
logV6DeprecationWarnings @ deprecations.ts:37
(anonymous) @ index.tsx:816
commitHookEffectListMount @ react-dom.development.js:23189
commitPassiveMountOnFiber @ react-dom.development.js:24965
commitPassiveMountEffects_complete @ react-dom.development.js:24930
commitPassiveMountEffects_begin @ react-dom.development.js:24917
commitPassiveMountEffects @ react-dom.development.js:24905
flushPassiveEffectsImpl @ react-dom.development.js:27078
flushPassiveEffects @ react-dom.development.js:27023
(anonymous) @ react-dom.development.js:26808
workLoop @ scheduler.development.js:266
flushWork @ scheduler.development.js:239
(anonymous) @ scheduler.development.js:533
postMessage
(anonymous) @ scheduler.development.js:574
requestHostCallback @ scheduler.development.js:588
unstable_scheduleCallback @ scheduler.development.js:441
scheduleCallback$1 @ react-dom.development.js:27576
ensureRootIsScheduled @ react-dom.development.js:25722
scheduleUpdateOnFiber @ react-dom.development.js:25570
updateContainer @ react-dom.development.js:28897
(anonymous) @ react-dom.development.js:29353
(anonymous) @ main.jsx:6
register:1 [DOM] Input elements should have autocomplete attributes (suggested: "current-password"): (More info: https://goo.gl/9p2vKq) <input name=​"password" type=​"password" required>​
AuthContext.jsx:7  POST http://localhost:8091/register net::ERR_CONNECTION_REFUSED
```
"failed to fetch"