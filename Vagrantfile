# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

	config.vm.box = "arcui"
  config.vm.box_url = "file://arcui.json"
  config.vm.hostname = "arc-ui"
  config.ssh.forward_agent = true
  config.ssh.forward_x11 = true
  config.vm.network :private_network, ip: "192.168.50.4"

  config.vm.provider "virtualbox" do |v|
    v.name = "arc-ui"
    v.customize ["modifyvm", :id, "--cpuexecutioncap", "75"]
    v.customize ["modifyvm", :id, "--cpus", "2"]
    v.customize ["modifyvm", :id, "--memory", "2048"]
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
		v.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]
    v.customize ["modifyvm", :id, "--nestedpaging", "off"]
  end

  if (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) == nil
    config.nfs.map_uid = Process.uid
    config.nfs.map_gid = Process.gid
    config.vm.synced_folder "./", "/current", type: "nfs", :mount_options => ['actimeo=1']
    config.vm.synced_folder "../", "/parent", type: "nfs", :mount_options => ['actimeo=1']

  else
    config.vm.synced_folder ".", "/current/"
    config.vm.synced_folder "..", "/parent/"
		config.vm.provision "shell", path: "npm_sym.sh"
  end

  config.vm.network :forwarded_port, guest: 3000, host: 8088  # browserSync
  config.vm.network :forwarded_port, guest: 8000, host: 8000  # 8000
  config.vm.network :forwarded_port, guest: 8089, host: 8089  # apache
  config.vm.network :forwarded_port, guest: 9876, host: 9876  # karma
  config.vm.network :forwarded_port, guest: 4444, host: 4444  # selenium
  config.vm.network :forwarded_port, guest: 5999, host: 5999  # vnc
  config.vm.network :forwarded_port, guest: 35729, host: 35729  # livereload
  config.vm.network :forwarded_port, guest: 3010, host: 3010  # browserSync for selenium tests

	config.vm.provision :shell, :path => "nvm.sh", privileged: false

#	config.vm.provision :shell, :inline => "mkdir /usr/local/bin/packer && cd /usr/local/bin/packer"
#	config.vm.provision :shell, :inline => "wget https://releases.hashicorp.com/packer/0.10.1/packer_0.10.1_linux_amd64.zip"
#	config.vm.provision :shell, :inline => "unzip packer_0.10.1_linux_amd64.zip"

	config.vm.provision :shell, :inline => "echo -e '#{File.read("#{Dir.home}/.gitconfig")}' > '/home/vagrant/.gitconfig'"


end
