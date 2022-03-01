#!/usr/bin/env bash

echo "Using launch wrapper."

# retrieve selenium start process ID
/opt/bin/start-selenium-node.sh & child=$!

shutdown_graceful() {
    echo "Requesting graceful shutdown of selenium node..."
    curl --request POST 'http://localhost:5555/se/grid/node/drain' --header 'X-REGISTRATION-SECRET;'
    wait ${child}
}

trap shutdown_graceful TERM KILL
wait ${child}