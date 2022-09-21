#!/bin/bash

#Run as root

#Change directory for downloads
cd /etc/systemd/system

#Download service files
wget https://github.com/mattswest/rock64_files/raw/main/.scripts/systemd/mounts/storage.mount
wget https://github.com/mattswest/rock64_files/raw/main/.scripts/systemd/mounts/mnt-sdb1-storage-audio.mount
wget https://github.com/mattswest/rock64_files/raw/main/.scripts/systemd/mounts/mnt-sdf1-movies.mount

#Enable service files
systemctl enable /etc/systemd/system/data.mount
systemctl enable /etc/systemd/system/storage.mount
systemctl enable /etc/systemd/system/mnt-sdb1-storage-audio.mount
systemctl enable /etc/systemd/system/mnt-sdf1-movies.mount
