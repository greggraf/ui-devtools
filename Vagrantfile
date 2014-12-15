# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "precise64"
  config.vm.hostname = "arc-ui"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
   config.vm.box_url = "http://files.vagrantup.com/precise64.box"


  config.vm.provider "virtualbox" do |v|
    v.name = "arc-ui"
    v.customize ["modifyvm", :id, "--cpuexecutioncap", "75"]
    v.customize ["modifyvm", :id, "--memory", "1024"]
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  end

  config.vm.network :private_network, ip: "192.168.50.4"
  config.vm.synced_folder ".", "/current/"
  config.vm.synced_folder "..", "/parent/"

  config.vm.network :forwarded_port, guest: 3000, host: 8088


  config.vm.provision "shell", path: "script.sh"

end
