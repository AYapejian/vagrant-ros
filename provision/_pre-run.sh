#!/bin/sh
export DEBIAN_FRONTEND=noninteractive
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

sudo locale-gen en_US.UTF-8
sudo dpkg-reconfigure -f noninteractive -p critical locales

sudo apt-get update
sudo apt upgrade -y
