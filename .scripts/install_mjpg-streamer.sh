#!/bin/bash

apt-get install cmake libjpeg8-dev
apt-get install gcc g++

cd /tmp
git clone https://github.com/mattswest/mjpg-streamer
cd mjpg-streamer/mjpg-streamer-experimental

make
make install
