#!/bin/bash

#Transfer files
#scp matt@192.168.86.190:/home/matt/.scripts/install_klipper_armbian_focal.sh /home/matt
#scp matt@192.168.86.190:/home/matt/printer.cfg /home/matt
scp matt@192.168.86.190:/home/matt/.scripts/lcd_display.sh /home/matt
scp matt@192.168.86.190:/home/matt/.scripts/lcd_write.py /home/matt
scp matt@192.168.86.190:/home/matt/.scripts/lcd.service /home/matt
scp matt@192.168.86.190:/home/matt/.scripts/octoprint.service /home/matt

#Install Klipper
#git clone https://github.com/KevinOConnor/klipper
#chmod +x install_klipper_armbian_focal.sh
#mv ./install_klipper_armbian_focal.sh klipper/scripts
#./klipper/scripts/install_klipper_armbian_focal.sh

#Install OctoPrint + OctoKlipper with startup service
sudo apt update
sudo apt install python3-pip virtualenv libpython3-dev -y
virtualenv OctoPrint
OctoPrint/bin/pip install OctoPrint
sudo cp octoprint.service /etc/systemd/system/octoprint.service -v
sudo systemctl daemon-reload
sudo systemctl enable octoprint

#Install OctoPrint plugins
#OctoPrint/bin/pip install "https://github.com/AliceGrey/OctoprintKlipperPlugin/archive/master.zip"
OctoPrint/bin/pip install "https://github.com/bchanudet/OctoPrint-Octorant/archive/master.zip"
OctoPrint/bin/pip install "https://github.com/Zinc-OS/continuousprint/archive/master.zip"
OctoPrint/bin/pip install "https://github.com/jneilliii/OctoPrint-PrusaSlicerThumbnails/archive/master.zip"
OctoPrint/bin/pip install "https://github.com/eyal0/OctoPrint-PrintTimeGenius/archive/master.zip"
OctoPrint/bin/pip install "https://github.com/fraschetti/Octoslack/archive/master.zip"
sudo systemctl start octoprint

#Install RPLCD i2c with scripts
python3 -m pip install RPLCD
sudo apt install i2c-tools python3-smbus python3-dev -y
sudo usermod -aG i2c matt
sudo cp -v lcd.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable lcd
sudo systemctl start lcd
