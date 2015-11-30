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


## Git Commands

- `git status` - show what branch you are on and what changes are tracked
- `git commit -m "commit message" filename` - commit file changes to local staging
- `git push origin dev` - push changes to dev branch from local staging to Stash remote repository 
- `git pull origin dev` - pull changes to dev branch from Stash remote repository into your local repository


## NPM Commands

- `npm install` - fetch and intall dependencies that are configured in package.json
- `npm run release` - gulp bump && gulp jenkins
- `npm run test` - gulp test
- `npm run e2e` - start Docker container, run `gulp protractor` for End to End tests, clean up Docker container

## Port Forwarding

- 3000  -> 8088 BrowserSync web server
- 35729 -> 35729 Live Reload server
- 8089  -> 8089 Apache web server (serving /parent/arc-ui/dist/)
- 9876  -> 9876 Karma test runner and results
- 4444  -> 4444 Selenium server (when Docker Container is running)
- 5999 - > 5999 VNC to see headless browser running in Docker container (not yet working)

## Included Software

- nodejs/npm
- nvm
- phantomjs
- curl
- htop
- git 2.x
- docker
- apache



## Windows and Vagrant and NPM

There are a few issues around running NPM in Windows that the Vagrant VM should help with. 

One obstacle is that some NPM packages use symbolic links and Windows has some limitations around symbolic links. I have enabled symbolic link support in the Vagrant configuration file, but it requires that the terminal window used to issue Vagrant command is "run as administrator". 

Another problem is that Windows has a 255 character limit on file paths.  The nested NPM dependency folder structure can bump up against that limit.

On Windows hosts Vagrant is configured to invoke a script that enters each chile directory of the /parent/ directory and creates a symbolic link from node_modules/ to a/home/vagrant/npm/\{directory name\}/node_modules/ directory.  The goal of this approach is to keep all the NPM packages *within the VM* and out of the Windows machine.

- http://blog.rudylee.com/2014/10/27/symbolic-links-with-vagrant-windows/
- http://kmile.nl/post/73956428426/npm-vagrant-and-symlinks-on-windows

## Packaging and Updating Our Vagrant Box

In order to speed up the `vagrant up` command, the following files are used to create a VM that can then be packaged up as a Vagrant box:

- arcui.json
- BaseVagrantFile

The `BaseVagrantFile` is used to provision a machine with all the software installed using the `phusion/ubuntu-12.04-amd64` base box. This machine can be created using the following Vagrant command:

`VAGRANT_VAGRANTFILE=BaseVagrantFile vagrant up`

After this machine is created, provisioned and running it can be packaged up as a Vagrant box called `arcui.box` using this command:

`vagrant package --output dist/arcui.box`

Once packaged this way, the default VagrantFile can use this box file start from.

The `arcui.json` file allows us to set up versioning on our box file.  If a new version appears or the checksum varies, the users `vagrant up` command will warn the user. Vagrant keeps local versions of the box file so this warning will keep happening until the user issues the command `vagrant box update`.

The JSON file is pretty self explanatory.  My plan is to update the as we create new files following the convention in place, changing the version number.  Then when the checksums don't match, grab the generated one from the console output and drop it into the JSON file.

We should not be putting the .box files into version control as they are pretty big and they are generated code.  So for now, I am manually uploading and storing them on S3 using a bucket from the Mobile Web account.  In the future this step should be part of a Jenkins build step and automated. 
