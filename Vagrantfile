# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  config.vm.define 'iaac-station'
  config.vm.hostname = "iaac-station"
  config.vm.provision "shell", path: "iaac.sh", run: "once"
  config.vm.network "forwarded_port", guest: 5000, host: 5000
  config.vm.network "forwarded_port", guest: 80, host: 8000
  config.vm.provider "virtualbox" do |v|
    v.cpus = 2
    v.memory = 1024
  end
end
