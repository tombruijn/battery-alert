#!/bin/bash

action=$1

if [ "$action" = "start" ]; then
  nohup sh ./main.sh & echo $! > ./pid &
elif [ "$action" = "stop" ]; then
  kill -9 $(cat ./pid)
fi

