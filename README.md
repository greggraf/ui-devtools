# ARC UI DevTools

The ARC UI project repository is in Git (Stash), so you must have access to http://stash.mtvi.com/ARC/ in order to check out code.
(But you probably know that already cause you are here).

If you need access to http://stash.mtvi.com/ but in a request to the DSS Jira queue.


## Prerequisites


### Git

If you are OS X and type "git" in the terminal application, it should prompt you and install for you automatically.

If you are on Windows look here: [http://git-scm.com/downloads]


### VirtualBox

Download from  [https://www.virtualbox.org/wiki/Downloads](https://www.virtualbox.org/wiki/Downloads)


### Vagrant

Download from [http://downloads.vagrantup.com/](http://downloads.vagrantup.com/)


### HipChat

Download from [https://www.hipchat.com/downloads](https://www.hipchat.com/downloads)  (or you can use the web client)

Currently the HipChat room associated with this project is `MTS - ARC-UI`


## Project Organization

We recommend creating a folder called 'arc' where all your projects will live.  When you launch your VM, there will be two directories mapped to your host machine:

`/current/` will map to the directory where this project lives
`/parent/` will map to the parent directory to where this project lives


## Starting Vagrant

From within the `ui-devtools` directory, issue `vagrant up` and the development VM will start. The first time, it can take up to 30 minutes, as it will be copying disk images and installing software.


## Vagrant Commands

- `vagrant ssh` - used to log into the VM
- `vagrant halt` - shutdown the VM
- `vagrant destroy` - shutdown the VM and erase all installed software.


## Port Forwarding

- 3000 -> 8081 web server
- 9876 -> 9876 Karma test runner and results


## Included Software

- nodejs/npm
- phantomjs
- curl
- htop
- git

