Vagrant.configure('2') do |c|
  c.cache.scope = :box if Vagrant.has_plugin?('vagrant-cachier')
end
