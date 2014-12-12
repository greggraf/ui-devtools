#!/bin/bash
 
echo "Provisioning virtual machine... for packer"

echo "Update apt-get"
sudo add-apt-repository ppa:chris-lea/node.js 
sudo apt-get update 

echo "Installing curl, htop, build essentials, openssl, libssl-dev, pkg-config"
sudo apt-get install curl -y
sudo apt-get install htop -y
sudo apt-get install build-essential openssl libssl-dev pkg-config -y



echo "nodejs"

cd /usr/local/src
sudo mkdir node
cd node
sudo wget http://nodejs.org/dist/v0.10.33/node-v0.10.33.tar.gz
sudo tar -xzf node-v0.10.33.tar.gz 
cd node-v0.10.33/
sudo ./configure
sudo make
sudo make install


