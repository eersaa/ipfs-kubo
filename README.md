- How to setup the project?
  - Add vagrant configuration?

# What is this project about?
  - Core is the private ipfs network

In this project we have set up private p2p network taking advantage of IPFS InterPlanetary File System [1] . 

# How to set up development environment

To be able to run the project you must have Docker and Docker Compose installed. If you are running Ubuntu linux you can run following commands to get packets installed.

```console
sudo apt update
sudo apt install -y docker.io docker-compose
sudo usermod -aG docker $USER

```
Reboot your system after install.

Installation instructions for all platforms: https://docs.docker.com/get-docker/.

## Option for Windows hosts

Option is to run the Docker in virtual machine. You can automate the creation of virtual machine with Vagrant. You need to install VirtualBox for virtual machines and Vagrant for automation.

Setup tested with:
 - Vagrant 2.3.4
 - VirtualBox 6.1.40

Install virtualbox guest additions plugin to enable automatic installation of virtualbox guest additions:

```console
vagrant plugin install vagrant-vbguest
```

Clone repository to some folder or copy the Vagrantfile and bootstrap.sh into folder. Open terminal in same folder and run `vagrant up`. Vagrant will set up the environment for you.

You can ssh to virtual machine with `vagrant ssh` or export the ssh profile with `vagrant ssh-config` and save it to your `~./ssh/config` and use your preferred tools to connect to VM.


# About branches
This repository has three main branches at the moment.

- master - will have the latest "stable" version combining functionalities
- private-swarm
  - This repository has latest setup for ipfs private network using secret key.
- networking
  - This repository has latest setup for networking of the containers to simulate the real world scenario.

<!-- References -->
[1]: