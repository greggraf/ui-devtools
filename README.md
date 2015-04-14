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
- phantomjs
- curl
- htop
- git 2.x
- docker
- apache

