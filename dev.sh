#!/bin/bash
# Ubuntu development setup script (Ubuntu 22.04)
# Author : Øystein Hansen

# Requere the script to run as root
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "$0 is not running as root. Try using sudo."
    exit 2
fi

# Update Package Repositories
apt-get update

## Installing initial packages
apt-get install -y curl wget dialog git zsh

# Update Snap's
snap refresh

# Install development Snap's
snap install code --classic
snap install google-cloud-sdk --classic
snap install postman
snap install brave
snap install gimp
snap install node --classic

# Install Google Crome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
apt-get install -y ./google-chrome-stable_current_amd64.deb
rm ./google-chrome-stable_current_amd64.deb

# Remove unvanted Snap's
snap remove firefox

# Install Docker
apt-get install -y docker.io
# Add user to docer group
# sudo usermod -aG docker $USER
# Install Docker-Compose
# apt-get install -y docker-compose

# Install and update system vide Python
apt-get -y install pipenv
python3 -m pip install --upgrade pip
python3 -m pip install --upgrade pipenv

# Add Python 3.10 - Default on Ubuntu 22.04 LTS
#apt-get install -y software-properties-common
#add-apt-repository -y ppa:deadsnakes/ppa 
#apt-get update
#apt-get install -y python3.10-full

# Enable firewall and install firewall tool.
ufw enable
apt-get install -y gufw
