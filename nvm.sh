#!/bin/bash

source /home/vagrant/.bash_profile

nvm install v5.3.0
nvm install v4.2.1

sed -i s/0.10.35/4.2.1/ /home/vagrant/.bash_profile
sed -i s/0.10.35/4.2.1/ /home/vagrant/.profile

npm install -g elm
