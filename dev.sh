#!/bin/bash
# Ubuntu development setup script (Ubuntu 22.04)
# Author : Øystein Hansen

# Requere the script to run as root
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "$0 is not running as root. Try using sudo."
    exit 2
fi

if [ -z "$SUDO_USER" ]; then
    echo "This script must be run with sudo."
    exit 1
fi

echo "* "
echo "* Update Package Repositories"
echo "* "
apt-get update


echo "* "
echo "* Install common development tools"
echo "* "
apt-get install -y curl wget dialog git zsh

echo "* "
echo "* Update Snap Store"
echo "* "
snap refresh


echo "* "
echo "* Install common development tools from Snap Store"
echo "* "
snap install google-cloud-sdk --classic
snap install postman
snap install brave
snap install gimp
snap install node --classic

echo "* "
echo "* Install VSCode"
echo "* "
snap install code --classic

echo "* "
echo "* Install VSCode Extention - Python"
echo "* "
code --install-extension ms-python.python

echo "* "
echo "* Install VSCode Extention - Git.Graph"
echo "* "
code --install-extension mhutchie.git-graph


echo "* "
echo "* Install Google Chrome"
echo "* "
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
apt-get install -y ./google-chrome-stable_current_amd64.deb
rm ./google-chrome-stable_current_amd64.deb

# Remove unvanted Snap's
# snap remove firefox

echo "* "
echo "* Install Docker"
echo "* "
apt-get install -y docker.io
echo "* "
echo "* Docker - Add USER to docker group"
echo "* "
usermod -aG docker $SUDO_USER

echo "* "
echo "* Install Docker-Compose"
echo "* "
apt-get install -y docker-compose


echo "* "
echo "* Install and update system wide Python"
echo "* "
apt-get -y install python3-pip
python3 -m pip install --upgrade pip

echo "* "
echo "* Install PDM (Python Development Master)"
echo "* "
curl -sSL https://pdm-project.org/install.sh | bash


echo "* "
echo "* Enable firewall and install firewall tool"
echo "* "
ufw enable
apt-get install -y gufw
