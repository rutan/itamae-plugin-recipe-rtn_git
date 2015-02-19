# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define :sl6 do |c|
    c.vm.box = 'sl6'
    c.vm.box_url = 'http://files.rutan.info/box/scientific-6-5-x64-virtualbox.box'
    c.vm.network :private_network, ip: '192.168.33.12'
  end

  config.vm.define :ubuntu1404 do |c|
    c.vm.box = "ubuntu1404"
    c.vm.box_url = 'https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box'
    c.vm.network :private_network, ip: '192.168.33.13'
  end
end
