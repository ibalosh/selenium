#!/bin/bash
# retrieve selenium availability JSON data
DOCKER_SE_HOST=localhost
SELENIUM_RESPONSE=$(curl -X POST -H "Content-Type: application/json" --data '{"query": "{ grid { totalSlots, sessionCount, sessionQueueSize } }"}' -s $DOCKER_SE_HOST:4444/graphql)

# calculate data and display on console
TOTAL_SLOTS=$(echo $SELENIUM_RESPONSE | jq -c ".data.grid.totalSlots")
SESSION_COUNT=$(echo $SELENIUM_RESPONSE | jq -c ".data.grid.sessionCount")
SESSION_QUEUE_SIZE=$(echo $SELENIUM_RESPONSE | jq -c ".data.grid.sessionQueueSize")
TAKEN=$(jq -c -n $(($SESSION_COUNT + $SESSION_QUEUE_SIZE))/$TOTAL_SLOTS*100)

# output selenium status
echo "$SELENIUM_RESPONSE" | jq -c
echo "selenium_slots_taken: $TAKEN"