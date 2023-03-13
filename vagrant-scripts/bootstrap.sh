#!/usr/bin/env bash

sudo apt update
sudo apt install -y \
    docker.io \
    docker-compose
sudo usermod -aG docker vagrant

sudo -u vagrant mkdir -p /home/vagrant/project
cd /home/vagrant/project
sudo -u vagrant git clone https://github.com/eersaa/ipfs-kubo.git
