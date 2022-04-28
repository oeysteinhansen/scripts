#!/bin/bash
# Ubuntu development setup script (Ubuntu 21.10)
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

# Install and update system vide Python
#apt install -y python3-pip pipenv
#python3 -m pip install --upgrade pip
#python3 -m pip install --upgrade pipenv

# Add Python 3.10
#apt-get install -y software-properties-common
#add-apt-repository -y ppa:deadsnakes/ppa 
#apt-get update
#apt-get install -y python3.10-full

# Install Pipenv
apt-get -y install pipenv

# Enable firewall and install firewall tool.
ufw enable
apt-get install -y gufw

# Configure Gnome favorite apps Layout
gsettings set org.gnome.shell favorite-apps "['google-chrome.desktop', 'org.gnome.Nautilus.desktop', 'snap-store_ubuntu-software.desktop', 'org.gnome.Terminal.desktop']"


