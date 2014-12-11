# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "precise64"
  config.vm.hostname = "logstash"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
   config.vm.box_url = "http://files.vagrantup.com/precise64.box"

 # config.vm.network :forwarded_port, guest: 80, host: 8080
 # config.vm.network :forwarded_port, guest: 3000, host: 8081
  config.vm.network :private_network, ip: "192.168.50.4"
  config.vm.synced_folder ".", "/current/"

  config.vm.provision "shell", inline: "sleep 10"
  config.vm.provision "shell", inline: "mkdir -p /tmp/packer/security"
  config.vm.provision "shell", inline: "chmod a+w /tmp/packer/security"
  config.vm.provision "shell", inline: "mkdir -p /tmp/packer/elasticsearch"
  config.vm.provision "shell", inline: "chmod a+w /tmp/packer/elasticsearch"

  config.vm.provision "file", source: "security/limits.conf", destination: "/tmp/packer/security/limits.conf"
  config.vm.provision "file", source: "elasticsearch/elasticsearch.yml", destination: "/tmp/packer/elasticsearch/elasticsearch.yml"
  config.vm.provision "file", source: "cron/curator", destination: "/tmp/curator"
  config.vm.provision "shell", path: "script.sh"

end
