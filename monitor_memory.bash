#!/bin/bash

now(){
  date '+%s'
}

NOW=$(now)
STOP_MONITORING=$(date --date="6 seconds" '+%s')

  echo "NOW: "$NOW
  echo "STOP_MONITORING: "$STOP_MONITORING

# while [ $COUNTER -lt 10 ];do
while [ $NOW -lt $STOP_MONITORING ]; do
  echo "counter: "$COUNTER
  echo "NOW: "$NOW
  echo "STOP_MONITORING: "$STOP_MONITORING
  sleep 1
  COUNTER=$((COUNTER + 1))  
  NOW=$(now)
  echo "NOW_UPDATED: "$NOW
  echo ""
done