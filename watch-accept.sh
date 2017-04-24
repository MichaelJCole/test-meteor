#!/bin/bash

PORT=${1:-3100}
URL="http://localhost:$PORT"

# Start Meteor
echo "Starting Meteor"
meteor test --full-app --driver-package tmeasday:acceptance-test-driver --port $PORT &
METEOR_PID=$!

# Stop Meteor on exit
trap 'kill $METEOR_PID' SIGINT

echo "Wait for Meteor to be ready..."
for i in seq 60; do 
  $(curl --output /dev/null --silent --head --fail $URL) && break 
  sleep 5
done

echo "Starting Acceptance Tests"
TEST_URL=$URL chimp --path=tests --watch --ddp=$URL
kill $METEOR_PID
