- How to setup the project?
  - Add vagrant configuration?

# What is this project about?
  - Core is the private ipfs network

In this project we have set up private p2p network taking advantage of InterPlanetary File System IPFS [1].

Assumption is that the nodes are able to find themselves using the bootstrap server. After clients have found other clients via bootstrap server it is not necessary anymore. We did not get the bootstrapping actually work in this small scale system. We experimented with multiple network setups with Docker networking.

Project represents a system where there are nodes that want to occasionally share some files with each other, but keep network restricted only the nodes that have the key for the network.

# How to run the system

1. Run `cleanup.sh` **Rename script to init?**
2. Run the `docker-compose.yaml`
3. Access the IPFS webui in address `localhost:5001/webui`

If you want to access other nodes with webui go to Settings page and change the port matching the port of the node.

# How to set up development environment

To be able to run the project you must have Docker and Docker Compose installed. If you are running Ubuntu linux you can run following commands to get packets installed.

```console
sudo apt update
sudo apt install docker.io docker-compose

```

```console
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
[1]: https://ipfs.tech/