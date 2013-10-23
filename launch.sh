#!/bin/bash

action=$1
log=./bat.log

function log {
  echo "$1" > $log
}

function pid {
  $(cat ./pid)
}

function isRunning {
  ps -p `cat ./pid` > /dev/null
}

function stopApp {
  if isRunning; then
    kill -9 `cat ./pid`
  fi
}

function startApp {
  log "---"
  log "Starting \"Battery alert\""
  sh ./main.sh > $log 2>&1 & echo $! > ./pid &
}

if [ "$action" = "start" ]; then
  if isRunning; then
    stopApp
    startApp
  else
    startApp
  fi
elif [ "$action" = "stop" ]; then
  log "Stopping \"Battery alert\""
  stopApp
elif [ "$action" = "status" ]; then
  if isRunning; then
    echo "Battery alert: Running!"
  else
    echo "Battery alert: Not running"
  fi
fi

