#!/bin/bash
 
echo "Provisioning virtual machine"

echo "Update apt-get"
sudo apt-get update 

echo "Installing curl, htop, build essentials, openssl, libssl-dev, pkg-config, git-core, libfontconfig, libfontconfig-dev, libfreetype6-dev"
sudo apt-get install curl -y
sudo apt-get install htop -y
sudo apt-get install build-essential openssl libssl-dev pkg-config -y
sudo apt-get install git-core -y

sudo apt-get install libfontconfig libfontconfig-dev libfreetype6-dev -y


echo "nodejs"

if ! type "node" > /dev/null; then 
  cd /usr/local/src
  sudo mkdir node
  cd node
  sudo wget http://nodejs.org/dist/v0.10.33/node-v0.10.33.tar.gz
  sudo tar -xzf node-v0.10.33.tar.gz 
  cd node-v0.10.33/
  sudo ./configure
  sudo make
  sudo make install
fi

echo "phantomjs"

if ! type "phantomjs" > /dev/null; then 
  cd /opt
  wget https://phantomjs.googlecode.com/files/phantomjs-1.9.2-linux-x86_64.tar.bz2
  sudo tar -xvf phantomjs-1.9.2-linux-x86_64.tar.bz2
  sudo ln -s /opt/phantomjs-1.9.2-linux-x86_64/bin/phantomjs /usr/local/bin/phantomjs
fi

echo "add node_modules/.bin to path"
echo 'export PATH=$PATH:node_modules/.bin' >> /home/vagrant/.profile
echo 'export PATH=$PATH:node_modules/.bin' >> /home/vagrant/.bash_profile
