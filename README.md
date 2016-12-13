# DevTools

## Prerequisites

### Git

If you are OS X and type "git" in the terminal application, it should prompt you and install for you automatically.

If you are on Windows look here: [http://git-scm.com/downloads]

#### VirtualBox ####

Download from  [https://www.virtualbox.org/wiki/Downloads](https://www.virtualbox.org/wiki/Downloads)

#### Vagrant ####

Download from [http://downloads.vagrantup.com/](http://downloads.vagrantup.com/)

## Project Organization

When you launch your VM, there will be two directories mapped to your host machine:

`/current/` will map to the directory where this project lives
`/parent/` will map to the directory above where this project lives

If you keep all of your projects as siblings of this project, they will 

#### Starting Vagrant ####

From within the `ui-devtools` directory, issue `vagrant up` and the development VM will start. The first time, it can take up to 30 minutes, as it will be copying disk images and installing software.

#####Vagrant Commands:#####

- `vagrant ssh` - used to log into the VM
- `vagrant halt` - shutdown the VM
- `vagrant destroy` - shutdown the VM and erase all installed software.

##### Port Forwarding#####
- 3000 -> 8081 web server
- 9876 -> 9876 Karma test runner and results

#####Included Software#####

- nodejs/npm
- phantomjs
- curl
- htop
- git

