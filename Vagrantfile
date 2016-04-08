# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.provider :digital_ocean do |provider, override|
    override.vm.box = 'digital_ocean'
    override.vm.box_url = 'https://github.com/smdahlen/vagrant-digitalocean/raw/master/box/digital_ocean.box'
    provider.token = ENV['DIGITALOCEAN_ACCESS_TOKEN']
    provider.region = 'sgp1'
    provider.size = '512MB'

    if ENV['USE_WERCKER'].to_i != 0
      provider.ssh_key_name = "wercker-#{ENV['WERCKER_GIT_REPOSITORY']}"
      override.ssh.private_key_path = '~/.ssh/id_rsa.vagrant'
    else
      provider.ssh_key_name = 'local'
      override.ssh.private_key_path = (ENV['SSH_ID_RSA_PATH'] || '~/.ssh/id_rsa')
    end
  end

  config.vm.define :centos7 do |c|
    c.vm.box = 'centos/7'
    c.vm.provider :digital_ocean do |provider, override|
      provider.image = 'centos-7-0-x64'
    end
    c.vm.hostname = 'ci-centos7'
    c.vm.hostname += "-#{ENV['WERCKER_BUILD_ID']}" if ENV['WERCKER_BUILD_ID']
  end

  config.vm.define :ubuntu1404 do |c|
    c.vm.box = 'ubuntu/1404'
    c.vm.provider :digital_ocean do |provider, override|
      provider.image = 'ubuntu-14-04-x64'
    end
    c.vm.hostname = 'ci-ubuntu1404'
    c.vm.hostname += "-#{ENV['WERCKER_BUILD_ID']}" if ENV['WERCKER_BUILD_ID']
  end
end

