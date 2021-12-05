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

# Remove unvanted Snap's
snap remove firefox

# Install Docker
apt-get install -y docker.io

# Install and update system vide Python
apt install -y python3-pip pipenv
python3 -m pip install --upgrade pip
python3 -m pip install --upgrade pipenv


