default['mysql_connector']['j']['version'] = '5.1.28'

default['mysql_connector']['j']['checksum'] =
  case node['mysql_connector']['j']['version']
  when '5.1.26' then 'fade4caa398c41f537d9b7bcaf83aabaa1eab1ef23c81de49979b5b04ba395bd'
  when '5.1.27' then 'a00f8d1524ba211e6d714c23fe79735883bd38fb4c73aabc0706fe3e65221073'
  when '5.1.28' then '93057e410ef5ae529e35ade6b517acbec41e30e2c3ecf08a891d1a2ef712337c'
  end
default['mysql_connector']['j']['install_paths'] = []
default['mysql_connector']['j']['jar_file'] = "mysql-connector-java-#{node['mysql_connector']['j']['version']}-bin.jar"
default['mysql_connector']['j']['tar_file'] = "mysql-connector-java-#{node['mysql_connector']['j']['version']}.tar.gz"

default['mysql_connector']['j']['archive_url'] = "http://cdn.mysql.com/archives/mysql-connector-java-5.1/#{node['mysql_connector']['j']['tar_file']}"
default['mysql_connector']['j']['url'] = "http://cdn.mysql.com/Downloads/Connector-J/#{node['mysql_connector']['j']['tar_file']}"
