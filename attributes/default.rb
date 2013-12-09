#
# Cookbook Name:: mysql_connector
# Attributes:: default
#
# Copyright 2012-2013
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

default['mysql_connector']['j']['install_paths'] = []
default['mysql_connector']['j']['version']  = '5.1.26'
default['mysql_connector']['j']['jar_file'] = "mysql-connector-java-#{node['mysql_connector']['j']['version']}-bin.jar"
default['mysql_connector']['j']['tar_file'] = "mysql-connector-java-#{node['mysql_connector']['j']['version']}.tar.gz"
default['mysql_connector']['j']['url']      = "http://cdn.mysql.com/Downloads/Connector-J/#{node['mysql_connector']['j']['tar_file']}"
default['mysql_connector']['j']['checksum'] = 'fade4caa398c41f537d9b7bcaf83aabaa1eab1ef23c81de49979b5b04ba395bd'
