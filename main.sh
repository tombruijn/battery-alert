#!/bin/bash

APP_NAME="Battery alert"
MIN_STATUS=15
MAX_STATUS=100
INTERVAL=60 # In seconds
NEXT_ALERT_TIME=0
NOTIFICATION_DELAY_TIME=300

function seconds_since_epoch {
  echo $(date +%s)
}

function notify {
  if [ "$NEXT_ALERT_TIME" -le "$(seconds_since_epoch)" ]; then
    now=$(seconds_since_epoch)
    NEXT_ALERT_TIME=$(($now + $NOTIFICATION_DELAY_TIME))
    growlnotify -n "$APP_NAME" -s -m "$1" $APP_NAME
    echo "Notify: $1"
  else
    echo "Notify (not sent): $1"
  fi
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

