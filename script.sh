#!/bin/bash

echo "Provisioning virtual machine"

echo "Update apt-get"
sudo apt-get update

echo "Install Docker and add vagrant to the docker group"

if ! command -v docker >/dev/null 2>&1; then
	echo "Docker not installed"
	sudo curl -sSL https://get.docker.com/ | sh
fi

sudo usermod -aG docker vagrant

echo "Installing curl, htop, build essentials, openssl, libssl-dev, pkg-config, libfontconfig, libfontconfig-dev, libfreetype6-dev, apache2"
sudo apt-get install curl -y
sudo apt-get install htop -y
sudo apt-get install build-essential openssl libssl-dev pkg-config -y
sudo apt-get install libfontconfig libfontconfig-dev libfreetype6-dev -y
sudo apt-get install apache2 -y

echo "switch apt repos and get 2.x version of git"
sudo apt-get install software-properties-common python-software-properties -y
sudo add-apt-repository ppa:git-core/ppa -y
sudo apt-get update
sudo apt-get install git -y

echo "phantomjs"

if ! type "phantomjs" > /dev/null; then
  cd /opt
  wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-1.9.8-linux-x86_64.tar.bz2
  sudo tar -xvf phantomjs-1.9.8-linux-x86_64.tar.bz2
  sudo ln -s /opt/phantomjs-1.9.8-linux-x86_64/bin/phantomjs /usr/local/bin/phantomjs
fi

echo "apache, jump on it"
mv /home/vagrant/files/arc-ui_apache /etc/apache2/sites-available/arc-ui
rm -f /etc/apache2/sites-enabled/arc-ui && ln -s /etc/apache2/sites-available/arc-ui /etc/apache2/sites-enabled/arc-ui
/etc/init.d/apache2 restart

echo "notify-send"
sudo apt-get install libnotify-bin -y

# this should probably be last
echo 'clean up /home/vagrant/files/'
rm -r /home/vagrant/files/
