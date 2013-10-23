#!/bin/bash

action=$1
log=./bat.log

function log {
  echo "$1" > $log
}

if [ "$action" = "start" ]; then
  log "---"
  log "Starting \"Battery alert\""
  sh ./main.sh > $log 2>&1 & echo $! > ./pid &
elif [ "$action" = "stop" ]; then
  log "Stopping \"Battery alert\""
  kill -9 $(cat ./pid)
fi

