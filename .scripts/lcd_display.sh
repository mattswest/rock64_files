#!/bin/bash

IP_ADDR="$(ifconfig | grep eth0 -A 1 | grep inet | tr -s ' ' | cut -d ' ' -f 3)"

SECONDS_LEFT="$(/home/matt/OctoPrint/bin/octoprint client get /api/job | cut -d ':' -f 22 | cut -d ',' -f 1 | tail -n 2 | head -n 1)"

MINUTES=$(( SECONDS_LEFT / 60 ))
SECONDS=$(( SECONDS_LEFT % 60 ))


/usr/bin/python3 /home/matt/lcd_write.py "$IP_ADDR" "$MINUTES" "$SECONDS"

sleep 10

SECONDS_LEFT="$(/home/matt/OctoPrint/bin/octoprint client get /api/job | cut -d ':' -f 22 | cut -d ',' -f 1 | tail -n 2 | head -n 1)"

MINUTES=$(( SECONDS_LEFT / 60 ))
SECONDS=$(( SECONDS_LEFT % 60 ))


/usr/bin/python3 /home/matt/lcd_write.py "$HOSTNAME" "$MINUTES" "$SECONDS"

sleep 10

