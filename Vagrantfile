# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "precise64"
  config.vm.hostname = "arc-ui"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
   config.vm.box_url = "http://files.vagrantup.com/precise64.box"

 # config.vm.network :forwarded_port, guest: 80, host: 8080
 # config.vm.network :forwarded_port, guest: 3000, host: 8081
  config.vm.network :private_network, ip: "192.168.50.4"
  config.vm.synced_folder ".", "/current/"
  config.vm.synced_folder "..", "/parent/"

  config.vm.provision "shell", path: "script.sh"

end
