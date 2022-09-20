#!/bin/bash

cd /etc/systemd/system

sudo wget https://github.com/mattswest/rock64_files/raw/main/.scripts/systemd/mounts/data.mount
sudo wget https://github.com/mattswest/rock64_files/raw/main/.scripts/systemd/mounts/storage.mount
sudo wget https://github.com/mattswest/rock64_files/raw/main/.scripts/systemd/mounts/mnt-sdb1-storage-audio.mount
sudo wget https://github.com/mattswest/rock64_files/raw/main/.scripts/systemd/mounts/mnt-sdf1-movies.mount

sudo systemctl enable /etc/systemd/system/data.mount
sudo systemctl enable /etc/systemd/system/storage.mount
sudo systemctl enable /etc/systemd/system/mnt-sdb1-storage-audio.mount
sudo systemctl enable /etc/systemd/system/mnt-sdf1-movies.mount

