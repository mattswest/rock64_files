#!/bin/bash

#Transfer files
wget https://github.com/mattswest/rock64_files/raw/main/.scripts/lcd_display.sh
wget https://github.com/mattswest/rock64_files/raw/main/.scripts/lcd_write.py
wget https://github.com/mattswest/rock64_files/raw/main/.scripts/lcd.service
wget https://github.com/mattswest/rock64_files/raw/main/.scripts/octoprint.service

#Install OctoPrint with startup service
sudo apt update
sudo apt install python3-pip virtualenv libpython3-dev -y
virtualenv OctoPrint
OctoPrint/bin/pip install OctoPrint
sudo cp octoprint.service /etc/systemd/system/octoprint.service -v
sudo systemctl daemon-reload
sudo systemctl enable octoprint

#Install OctoPrint plugins
OctoPrint/bin/pip install "https://github.com/bchanudet/OctoPrint-Octorant/archive/master.zip"
OctoPrint/bin/pip install "https://github.com/Zinc-OS/continuousprint/archive/master.zip"
OctoPrint/bin/pip install "https://github.com/jneilliii/OctoPrint-PrusaSlicerThumbnails/archive/master.zip"
OctoPrint/bin/pip install "https://github.com/eyal0/OctoPrint-PrintTimeGenius/archive/master.zip"
OctoPrint/bin/pip install "https://github.com/jneilliii/OctoPrint-BedLevelVisualizer/archive/master.zip"
sudo systemctl start octoprint

#Install RPLCD i2c with scripts
python3 -m pip install RPLCD
sudo apt install i2c-tools python3-smbus python3-dev -y
sudo usermod -aG i2c matt
chmod +x lcd_display.sh
chmod +x lcd_write.py
sudo cp -v lcd.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable lcd
sudo systemctl start lcd
