#!/bin/bash

echo "add node_modules/.bin to path"

if [[ :$PATH: == *:"node_modules/.bin":* ]] ; then
  echo "its there"
else
  echo "need to add"
  echo 'export PATH=$PATH:node_modules/.bin' >> /home/vagrant/.profile
  echo 'export PATH=$PATH:node_modules/.bin' >> /home/vagrant/.bash_profile
fi


echo "install nvm Node Version Manager"

if ! command -v nvm >/dev/null 2>&1; then

  curl https://raw.githubusercontent.com/creationix/nvm/v0.23.3/install.sh | bash

  echo "source /home/vagrant/.nvm/nvm.sh" >> /home/vagrant/.profile
  echo "source /home/vagrant/.nvm/nvm.sh" >> /home/vagrant/.bash_profile  
  
  source /home/vagrant/.bash_profile

	nvm install 4.0.0
	nvm install 0.10.35

  echo "nvm use 0.10.35" >> /home/vagrant/.profile
  echo "nvm use 0.10.35" >> /home/vagrant/.bash_profile

fi