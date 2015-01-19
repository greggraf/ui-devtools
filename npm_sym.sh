#!/bin/bash
 
echo "create /home/vagrant/npm/ if it doesn't exist"
[ ! -d /home/vagrant/npm  ] && mkdir /home/vagrant/npm
chown vagrant "/home/vagrant/npm"

echo "create sym links "

cd /parent

for f in *;
  do 
    
    [ ! -d "/home/vagrant/npm/$f/node_modules"  ] && mkdir -p "/home/vagrant/npm/$f/node_modules"
    chown vagrant "/home/vagrant/npm/$f/node_modules"
    
    [ -d "$f/node_modules" ] &&  rm -r "$f/node_modules"
    [ -f "$f/node_modules" ] &&  rm  "$f/node_modules"
    ln -s "/home/vagrant/npm/$f/node_modules" "$f/node_modules"

  done;
