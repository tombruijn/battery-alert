#!/bin/bash

action=$1
log=./bat.log

function log {
  echo "$1" >> "$log"
}

function pid {
  $(cat ./pid)
}

function isRunning {
  ps -p `cat ./pid` > /dev/null
}

function stopApp {
  log "Stopping \"Battery alert\""
  if isRunning; then
    kill -9 `cat ./pid`
  else
    log "Battery alert not running"
  fi
}

function startApp {
  log "---"
  log "Starting \"Battery alert\""
  sh ./main.sh > $log 2>&1 & echo $! > ./pid &
}

case "$action" in
  "start")
    if isRunning; then
      stopApp
      startApp
    else
      startApp
    fi
    ;;
  "stop")
    stopApp
    ;;
  "status")
    if isRunning; then
      echo "Battery alert: Running!"
    else
      echo "Battery alert: Not running"
    fi
    ;;
esac
