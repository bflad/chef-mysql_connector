action :create do
  #
  # MySQL Connector/J .tar.gz now contains extra directory and ark's
  # :cherry_pick does not support --strip-components=1 currently
  #
  #  ark "mysql-connector-java" do
  #    url node['mysql_connector']['j']['url']
  #    checksum node['mysql_connector']['j']['checksum']
  #    creates node['mysql_connector']['j']['jar_file']
  #    path new_resource.path
  #    action :cherry_pick
  #  end
  #

  remote_file "#{Chef::Config[:file_cache_path]}/#{node['mysql_connector']['j']['tar_file']}" do
    source node['mysql_connector']['j']['url']
    checksum node['mysql_connector']['j']['checksum']
    mode 00644
    ignore_failure true
    action :create
  end

  # BEGIN: This is workaround for remote_file not supporting 404's
  # This is after various attempts at begin/rescue and requires ignore_failure above.
  remote_file "#{Chef::Config[:file_cache_path]}/#{node['mysql_connector']['j']['tar_file']}-archive_url" do
    source node['mysql_connector']['j']['archive_url']
    checksum node['mysql_connector']['j']['checksum']
    mode 00644
    not_if "test -s #{Chef::Config[:file_cache_path]}/#{node['mysql_connector']['j']['tar_file']}"
    action :create
  end

  execute 'mysql_connector_j_mv_archive_url' do
    cwd Chef::Config[:file_cache_path]
    command "mv #{node['mysql_connector']['j']['tar_file']}-archive_url #{node['mysql_connector']['j']['tar_file']}"
    not_if "test -s #{Chef::Config[:file_cache_path]}/#{node['mysql_connector']['j']['tar_file']}"
    action :run
  end
  # END: This is workaround for remote_file not supporting 404's

  execute "mysql-connector-java-#{new_resource.path}" do
    cwd Chef::Config[:file_cache_path]
    command "tar --strip-components=1 -xzf #{node['mysql_connector']['j']['tar_file']} -C #{new_resource.path} mysql-connector-java-#{node['mysql_connector']['j']['version']}/#{node['mysql_connector']['j']['jar_file']}"
    creates "#{new_resource.path}/#{node['mysql_connector']['j']['jar_file']}"
    action :run
  end

  new_resource.updated_by_last_action(true)
end
