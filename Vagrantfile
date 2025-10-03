# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "debian/bullseye64"
  config.vm.define "servidor" do |servidor|
    servidor.vm.hostname = "servidordhcp"
    servidor.vm.network "private_network", ip: "192.168.56.10"
    servidor.vm.network "private_network", ip: "192.168.57.10", virtualbox__intnet: "vboxnet0"
    servidor.vm.provision "shell", path: "provision_servidor.sh"
end
  config.vm.define "c1" do |c1|
    c1.vm.hostname = "c1"
    c1.vm.network "private_network", type: "dhcp", virtualbox__intnet: "vboxnet0"
  end
  config.vm.define "c2" do |c2|
    c2.vm.hostname = "c2"
    c2.vm.network "private_network", type: "dhcp", virtualbox__intnet: "vboxnet0", mac: "0800278dc04d"
  end
end
