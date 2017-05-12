#!/bin/bash
parity --author "0x4c182245e6f85e8fc5803f687b5ff9a731be4e5a" --no-dapps --geth --pruning fast --unlock "0x4c182245e6f85e8fc5803f687b5ff9a731be4e5a" --rpc --rpcaddr "127.0.0.1" --rpcport 8545 --cache=10240 --password $WALLET_PASSWORD_FILE_PATH --allow-ips public --cache-size-db 10240 -d ~/.ethereum/parity
