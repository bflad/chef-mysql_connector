# Base hostname
cookbook = 'mysql_connector'
hostname = 'mysql-connector'

Vagrant.configure('2') do |config|
  config.berkshelf.enabled = true
  config.cache.auto_detect = true
  config.omnibus.chef_version = :latest

  config.vm.define :centos6 do |centos6|
    centos6.vm.box      = 'chef/centos-6.6'
    centos6.vm.hostname = "#{hostname}-centos-6"
  end

  config.vm.define :centos7 do |centos7|
    centos7.vm.box      = 'chef/centos-7.1'
    centos7.vm.hostname = "#{hostname}-centos-7"
  end

  config.vm.define :debian8 do |debian8|
    debian8.vm.box      = 'chef/debian-8.0'
    debian8.vm.hostname = "#{hostname}-debian-8"
  end

  config.vm.define :fedora21 do |fedora21|
    fedora21.vm.box      = 'chef/fedora-21'
    fedora21.vm.hostname = "#{hostname}-fedora-21"
  end

  config.vm.define :freebsd10 do |freebsd10|
    freebsd10.vm.box      = 'chef/freebsd-10.0'
    freebsd10.vm.hostname = "#{hostname}-freebsd-10"
  end

  config.vm.define :ubuntu1404 do |ubuntu1404|
    ubuntu1404.vm.box      = 'chef/ubuntu-14.04'
    ubuntu1404.vm.hostname = "#{hostname}-ubuntu-1404"
  end

  config.vm.define :ubuntu1504 do |ubuntu1504|
    ubuntu1504.vm.box      = 'chef/ubuntu-15.04'
    ubuntu1504.vm.hostname = "#{hostname}-ubuntu-1504"
  end

  config.vm.network :private_network, ip: '192.168.50.10'

  config.vm.provider 'virtualbox' do |v|
    v.customize ['modifyvm', :id, '--memory', 1024]
  end

  config.vm.provision :chef_solo do |chef|
    chef.log_level = :debug
    chef.json = {
      'mysql_connector' => { 'j' => { 'install_paths' => ['/tmp'] } }
    }
    chef.run_list = [
      "recipe[#{cookbook}::j]"
    ]
  end
end
