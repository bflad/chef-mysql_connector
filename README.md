# chef-mysql_connector [![Build Status](https://secure.travis-ci.org/bflad/chef-mysql_connector.png?branch=master)](http://travis-ci.org/bflad/chef-mysql_connector)

## Description

Recipes/LWRPs for installing MySQL Connectors.

## Requirements

### Chef

* Chef 11+ is required for version 0.6.0+ of this cookbook

### Platforms

* CentOS 5+
* Fedora 17+
* RedHat 5+
* Ubuntu 10.04+

## Attributes

These attributes are under the `node['mysql_connector']['j']` namespace.

Attribute | Description | Type | Default
----------|-------------|------|--------
checksum | SHA256 checksum for MySQL Connector/J | String | auto-detected or will log WARN
install_paths | MySQL Connector/J installation paths | Array of Strings | []
jar_file | Filename of MySQL Connector/J .jar | String | `mysql-connector-java-#{node['mysql_connector']['j']['version']}-bin.jar`
tar_file | Filename of MySQL Connector/J .tar.gz | String | `mysql-connector-java-#{node['mysql_connector']['j']['version']}.tar.gz`
url | URL for MySQL Connector/J | String | auto-detected between `http://cdn.mysql.com/Downloads/Connector-J/#{tar_file}` and `http://cdn.mysql.com/archives/mysql-connector-java-5.1/#{tar_file}`
version | Version of MySQL Connector/J to install | String | 5.1.36

## Recipes

* `recipe[mysql_connector]` empty recipe for including LWRPs
* `recipe[mysql_connector::j]` will install MySQL Connector/J from attribute

## Usage

### MySQL Connector/J installation via attribute

* Add installation paths to `node['mysql_connector']['j']['install_paths']`
  array
* Include `recipe[mysql_connector::j]` in your node's run list

### MySQL Connector/J installation via LWRP

* Add `depends 'mysql_connector'` to your cookbook metadata
* Add to recipe:

```ruby
mysql_connector_j '/path/to/install/location'
```

## Testing and Development

* Quickly testing with Vagrant: [VAGRANT.md](VAGRANT.md)
* Full development and testing workflow with Test Kitchen and friends: [TESTING.md](TESTING.md)

## Contributing

Please see contributing information in: [CONTRIBUTING.md](CONTRIBUTING.md)

## Maintainers

* Brian Flad (<bflad417@gmail.com>)

## License

Please see licensing information in: [LICENSE](LICENSE)
