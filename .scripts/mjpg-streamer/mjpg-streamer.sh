#!/bin/bash

##Finds valid video source before running mjpg-streamer

VIDEOLIST=$(ls -1 /dev/video*)

for i in $VIDEOLIST
do
        TEST="$(uvcdynctrl -c -d $i | grep No\ controls)"
        if [ -z "$TEST" ]
        then
                WEBCAM="$i"
        fi
done

/usr/local/bin/mjpg_streamer -i "input_uvc.so -d $WEBCAM -r 1920x1080" -o "output_http.so -p 8080"
