#!/bin/sh
export DEBIAN_FRONTEND=noninteractive

# sudo apt-get -y install open-vm-tools-desktop
# sudo apt-get -y install xubuntu-core^

sudo apt-get install -y open-vm-tools-desktop
# sudo apt install -y open-vm-tools open-vm-tools-desktop
# sudo apt-get update
sudo apt-get install -y --no-install-recommends lightdm xubuntu-desktop xserver-xorg-input-all

sudo cat >/etc/lightdm/lightdm.conf.d/12-autologin.conf <<EOL
[Seat:*]
autologin-user=vagrant
autologin-user-timeout=0
EOL
