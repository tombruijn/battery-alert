#!/bin/bash
source config.cfg
source functions

while [ true ]
do
  # see: http://hints.macworld.com/article.php?story=20100130123935998
  BATTERY_STATUS=$(pmset -g ps | sed -n 's/.*[[:blank:]]+*\(.*\)%.*/\1/p')
  log "Current battery charge: $BATTERY_STATUS%"

  if [ "$BATTERY_STATUS" -le "$MIN_STATUS" ]; then
    notify "Minimum battery charge reached"
  elif [ "$BATTERY_STATUS" -ge "$MAX_STATUS" ]; then
    notify "Maximum battery charge reached"
  fi

  sleep $INTERVAL
done

