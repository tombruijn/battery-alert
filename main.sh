#!/bin/bash

APP_NAME="Battery alert"
MIN_STATUS=10
MAX_STATUS=100
INTERVAL=60 # In seconds

function notify {
  growlnotify -n "$APP_NAME" -s -m "$1" $APP_NAME
}

while [ true ]
do
  # see: http://hints.macworld.com/article.php?story=20100130123935998
  BATTERY_STATUS=$(pmset -g ps | sed -n 's/.*[[:blank:]]+*\(.*\)%.*/\1/p')
  echo "Current battery charge: $BATTERY_STATUS%"

  if [ "$BATTERY_STATUS" -le "$MIN_STATUS" ]; then
    notify "Minimum battery charge reached"
  elif [ "$BATTERY_STATUS" -ge "$MAX_STATUS" ]; then
    notify "Maximum battery charge reached"
  fi

  sleep $INTERVAL
done

