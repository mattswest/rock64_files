#!/bin/bash

#Run as root

#Change directory for downloads
cd /etc/systemd/system

#Remove existing files
echo "Removing existing .mount files"
rm data.mount*
rm storage.mount*
rm mnt-sdb1-storage-audio.mount*
rm mnt-sdf1-movies.mount*

#Download service files
echo "Downloading .mount files"
wget -q https://github.com/mattswest/rock64_files/raw/main/.scripts/systemd/mounts/data.mount && echo "Downloaded data.mount" 
wget -q https://github.com/mattswest/rock64_files/raw/main/.scripts/systemd/mounts/storage.mount && echo "Downloaded storage.mount"
wget -q https://github.com/mattswest/rock64_files/raw/main/.scripts/systemd/mounts/mnt-sdb1-storage-audio.mount && echo "Downloaded mnt-sdb1-storage-audio.mount"
wget -q https://github.com/mattswest/rock64_files/raw/main/.scripts/systemd/mounts/mnt-sdf1-movies.mount && echo "Downloaded mnt-sdf1-movies.mount"

#Enable service files
echo "Enabling .mount files"
systemctl enable /etc/systemd/system/data.mount
systemctl enable /etc/systemd/system/storage.mount
systemctl enable /etc/systemd/system/mnt-sdb1-storage-audio.mount
systemctl enable /etc/systemd/system/mnt-sdf1-movies.mount

