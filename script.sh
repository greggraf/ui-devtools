#!/bin/bash
 
echo "Provisioning virtual machine... for packer"

echo "Update apt-get"
sudo apt-get update 

echo "Java, curl, htop"
sudo apt-get install openjdk-7-jre-headless -y
sudo apt-get install curl -y
sudo apt-get install htop -y

echo "ElasticSearch"
if [ ! -f "./elasticsearch-1.1.1.deb" ]; then wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.1.1.deb; fi
sudo dpkg -i elasticsearch-1.1.1.deb
sudo cp /tmp/packer/elasticsearch/elasticsearch.yml /etc/elasticsearch/elasticsearch.yml
cd /usr/share/elasticsearch/
sudo bin/plugin -install elasticsearch/elasticsearch-cloud-aws/2.1.1


sudo service elasticsearch start
sudo update-rc.d elasticsearch defaults

echo "install pip so i can install elasticsearch-curator"
sudo apt-get install python-pip -y

echo "pip install elasticsearch-curator"
sudo pip install elasticsearch-curator

echo "crontabs?"
sudo crontab /tmp/curator