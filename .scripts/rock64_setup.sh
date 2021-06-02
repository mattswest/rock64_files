!/bin/bash

sudo useradd matt \
&& sudo passwd matt \
&& sudo usermod -a -G sudo matt \
& sudo mkdir /home/matt \
&& sudo chown -R matt:matt /home/matt \
&& sudo chsh matt \
&& sudo scp matt@192.168.86.190:/home/matt/.bashrc /home/matt \
&& sudo vi /etc/hostname \
&& sudo vi /etc/hosts
