#!/bin/bash

apt-get install -y cmake libjpeg8-dev gcc g++ uvcdynctrl

cd /tmp
git clone https://github.com/mattswest/mjpg-streamer
cd mjpg-streamer/mjpg-streamer-experimental

make
make install
