#!/bin/bash

PID1=$(ps -ef | grep -w code \
         | grep -v 'grep --color' \
         | awk '{print $2}' \
         | sort -n\
         | head -1)


[ "$PID1" ] && kill $PID1