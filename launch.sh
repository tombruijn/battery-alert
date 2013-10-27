#!/bin/bash
source config.cfg
source functions

action=$1

function pid {
  $(cat ./pid)
}

function isRunning {
  ps -p `cat ./pid` > /dev/null
}

function stopApp {
  log "Stopping \"$APP_NAME\"" true
  if isRunning; then
    kill -9 `cat ./pid`
  else
    log "$APP_NAME not running" true
  fi
}

function startApp {
  log "---"
  log "Starting \"$APP_NAME\"" true
  sh ./main.sh >> $LOG_FILE 2>&1 & echo $! > ./pid &
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
      echo "$APP_NAME: Running!"
    else
      echo "$APP_NAME: Not running"
    fi
    ;;
esac

