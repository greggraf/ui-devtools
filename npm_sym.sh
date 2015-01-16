#!/bin/bash
 
echo "create /home/vagrant/npm/ if it doesn't exist"
[ ! -d /home/vagrant/npm  ] && mkdir /home/vagrant/npm
chown vagrant "/home/vagrant/npm"

echo "create sym links "

cd /parent

for f in *;
  do 
    [ -d $f ] && cd "$f"
    [ ! -d "/home/vagrant/npm/$f/node_modules"  ] && mkdir -p "/home/vagrant/npm/$f/node_modules"
    chown vagrant "/home/vagrant/npm/$f/node_modules"
    rm -r node_modules
    ln -s "/home/vagrant/npm/$f/node_modules" node_modules
  done;
