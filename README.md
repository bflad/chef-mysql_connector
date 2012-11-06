# chef-mysql_connector [![Build Status](https://secure.travis-ci.org/bflad/chef-mysql_connector.png?branch=master)](http://travis-ci.org/bflad/chef-mysql_connector)

## Description

Recipes/LWRPs for installing MySQL Connectors.

## Requirements

### Platforms

* RedHat 6.3 (Santiago)

### Cookbooks

* ark

## Attributes

* `node['mysql_connector']['j']['install_paths']` - Array of MySQL Connector/J
  installation paths, defaults to []
* `node['mysql_connector']['j']['version']` - Version of MySQL Connector/J to
  install.
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
