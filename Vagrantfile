# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "phusion/ubuntu-12.04-amd64"
  config.vm.hostname = "arc-ui"
  config.ssh.forward_agent = true
  config.ssh.forward_x11 = true
  config.vm.network :private_network, type: "dhcp"

  config.vm.provider "virtualbox" do |v|
    v.name = "arc-ui"
    v.customize ["modifyvm", :id, "--cpuexecutioncap", "75"]
    v.customize ["modifyvm", :id, "--cpus", "2"]
    v.customize ["modifyvm", :id, "--memory", "2048"]
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--nestedpaging", "off"]
  end

  if (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) == nil
    config.nfs.map_uid = Process.uid
    config.nfs.map_gid = Process.gid
    config.vm.synced_folder "./", "/current", type: "nfs"

    config.vm.synced_folder "../", "/parent", type: "nfs"

  else
    config.vm.synced_folder ".", "/current/"
    config.vm.synced_folder "..", "/parent/"
  end

  config.vm.network :forwarded_port, guest: 3000, host: 8088  # browserSync
  config.vm.network :forwarded_port, guest: 8089, host: 8089  # apache
  config.vm.network :forwarded_port, guest: 9876, host: 9876  # karma
  config.vm.network :forwarded_port, guest: 4444, host: 4444  # selenium
  config.vm.network :forwarded_port, guest: 5999, host: 5999  # vnc
  config.vm.network :forwarded_port, guest: 35729, host: 35729  # livereload


	config.vm.provision "file", source: "files/arc-ui_apache", destination: "/home/vagrant/files/arc-ui_apache"

	config.vm.provision :shell, :inline => "echo -e '#{File.read("#{Dir.home}/.gitconfig")}' > '/home/vagrant/.gitconfig'"
	config.vm.provision "shell", path: "script.sh"

# install nvm for the vagrant user and install io.js 
 	config.vm.provision :shell, :privileged => false, :inline => "if ! type 'nvm' > /dev/null; then curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.25.1/install.sh | PROFILE=~/.bash_profile bash; fi"
 	config.vm.provision :shell, :privileged => false, :inline => 'source ~/.bash_profile && nvm install iojs && nvm use system'


end
