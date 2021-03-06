#!/bin/sh

sudo apt-get update

# Utilerias
sudo apt install -y build-essential apt-transport-https ca-certificates curl software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"

sudo apt update

apt-cache policy docker-ce

sudo apt install docker-ce

sudo systemctl status docker

sudo usermod -aG docker ${USER}

echo .
echo "Debes de abrir una nueva sesion como el usuario ${USER}"
echo .