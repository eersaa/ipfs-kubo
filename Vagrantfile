Vagrant.configure("2") do |config|
    config.vm.define "ds-dev"
    config.vm.box = "generic/ubuntu2004"
    config.vm.provider "virtualbox" do |vb|
      vb.cpus = 2
      vb.memory = 2048
    end
    
    config.vm.provision "shell", path: "./vagrant-scripts/bootstrap.sh"
  end
