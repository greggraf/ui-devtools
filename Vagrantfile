# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "precise64"
  config.vm.hostname = "arc-ui"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.ssh.forward_agent = true
  config.ssh.forward_x11 = true
  config.vm.network :private_network, ip: "33.33.33.11"

  config.vm.provider "virtualbox" do |v|
    v.name = "arc-ui"
    v.customize ["modifyvm", :id, "--cpuexecutioncap", "75"]
    v.customize ["modifyvm", :id, "--memory", "1024"]
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
		v.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]    
    v.customize ["modifyvm", :id, "--nestedpaging", "off"]
  end

  if (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) == nil
    config.nfs.map_uid = Process.uid
    config.nfs.map_gid = Process.gid
    config.vm.synced_folder "./", "/current", :create => true, :nfs => true, mount_options: ["nolock", "actimeo=1"]
    config.vm.synced_folder "../", "/parent", :create => true, :nfs => true, mount_options: ["nolock", "actimeo=1"]
  else
    config.vm.synced_folder ".", "/current/"
    config.vm.synced_folder "..", "/parent/"
		config.vm.provision "shell", path: "npm_sym.sh"
  end

  config.vm.network :forwarded_port, guest: 3000, host: 8088
  config.vm.network :forwarded_port, guest: 9876, host: 9876

  config.vm.provision :shell, :inline => "echo -e '#{File.read("#{Dir.home}/.gitconfig")}' > '/home/vagrant/.gitconfig'"
  config.vm.provision "shell", path: "script.sh"

end
