#!/bin/bash

# Wait until PostgreSQL started and listens on port 5432.
while [ -z "`netstat -tln | grep 8545`" ]; do
  echo 'Waiting for geth to start ...'
  sleep 1
done
echo 'geth started.'
sleep 5

# Start server.
echo 'Starting pool...'
/opt/open-ethereum-pool/build/bin/open-ethereum-pool /opt/open-ethereum-pool/config.json
