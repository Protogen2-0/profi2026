start cmd /k "cd ./geth && RD /S /Q "geth" & DEL "history" & geth --datadir "./" init genesis.json & geth --dev --datadir "./" --http --http.addr 127.0.0.1 --http.port 8545 --http.api="eth,web3,net,personal" --http.corsdomain "*" console"
start cmd /k "cd ./front && npm run dev -- --open"
start cmd /k "cd ./hardhat && npx hardhat ignition deploy ignition/modules/Storage.ts --network geth"