require File.expand_path('../support/helpers', __FILE__)

describe_recipe 'mysql_connector::j' do
  include Helpers::MysqlConnector

  it 'installs MySQL Connector/J in all install_paths' do
    node['mysql_connector']['j']['install_paths'].each do |path|
      file("#{path}/mysql-connector-java-#{node['mysql_connector']['j']['version']}-bin.jar").must_exist
    end
  end
end
