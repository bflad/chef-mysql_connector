action :create do
  ark 'mysql-connector-java' do
    url node['mysql_connector']['j']['url']
    checksum node['mysql_connector']['j']['checksum']
    creates node['mysql_connector']['j']['jar_file']
    path new_resource.path
    action :cherry_pick
  end

  new_resource.updated_by_last_action(true)
end
