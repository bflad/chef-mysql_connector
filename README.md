# chef-mysql_connector [![Build Status](https://secure.travis-ci.org/bflad/chef-mysql_connector.png?branch=master)](http://travis-ci.org/bflad/chef-mysql_connector)

## Description

Recipes/LWRPs for installing MySQL Connectors.

## Requirements

### Platforms

* RedHat 6.3 (Santiago)
* Ubuntu 12.04 LTS (Precise Pangolin)

## Attributes

* `node['mysql_connector']['j']['install_paths']` - Array of MySQL Connector/J
  installation paths, defaults to []
* `node['mysql_connector']['j']['version']` - Version of MySQL Connector/J to
* `node['mysql_connector']['j']['jar_file']` - filename of MySQL Connector/J .jar, defaults to `mysql-connector-java-#{node['mysql_connector']['j']['version']}-bin.jar`
* `node['mysql_connector']['j']['tar_file']` - filename of MySQL Connector/J .tar.gz, defaults to `mysql-connector-java-#{node['mysql_connector']['j']['version']}.tar.gz`
* `node['mysql_connector']['j']['url']` - URL for MySQL Connector/J, defaults to
  "http://cdn.mysql.com/Downloads/Connector-J/mysql-connector-java-#{node['mysql_connector']['j']['version']}.tar.gz"
* `node['mysql_connector']['j']['checksum']` - SHA256 checksum for MySQL
  Connector/J

## Recipes

* `recipe[mysql_connector]` empty recipe for including LWRPs
* `recipe[mysql_connector::j]` will install MySQL Connector/J from attribute
* `recipe[mysql_connector::odbc_package]` will install MySQL Connector/ODBC from
  package.

## Usage

### MySQL Connector/J installation via attribute

* Add installation paths to `node['mysql_connector']['j']['install_paths']`
  array
* Include `recipe[mysql_connector::j]` in your node's run list

### MySQL Connector/J installation via LWRP

* Add `depends "mysql_connector"` to cookbook metadata
* Add to cookbook recipe:

```ruby
include_recipe "mysql_connector"
mysql_connector_j "/path/to/install/location"
```

## Testing and Development

Here's how you can quickly get testing or developing against the cookbook thanks to [Vagrant](http://vagrantup.com/) and [Berkshelf](http://berkshelf.com/).

    vagrant plugin install vagrant-berkshelf
    vagrant plugin install vagrant-cachier
    vagrant plugin install vagrant-omnibus
    git clone git://github.com/bflad/chef-mysql_connector.git
    cd chef-mysql_connector
    vagrant up BOX # BOX being centos5, centos6, debian7, fedora18, fedora19, fedora20, freebsd9, ubuntu1204, ubuntu1210, ubuntu1304, or ubuntu1310

You can then SSH into the running VM using the `vagrant ssh BOX` command.

The VM can easily be stopped and deleted with the `vagrant destroy` command. Please see the official [Vagrant documentation](http://docs.vagrantup.com/v2/cli/index.html) for a more in depth explanation of available commands.

## Contributing

Please use standard Github issues/pull requests.

## License and Author

Author:: Brian Flad (<bflad417@gmail.com>)

Copyright:: 2012-2013

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
