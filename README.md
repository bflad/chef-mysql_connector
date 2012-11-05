# chef-mysql_connector [![Build Status](https://secure.travis-ci.org/bflad/chef-mysql_connector.png?branch=master)](http://travis-ci.org/bflad/chef-mysql_connector)

## Description

Recipes/LWRPs for installing MySQL Connectors.

## Requirements

### Platforms

* RedHat 6.3 (Santiago)

### Cookbooks

* ark

## Attributes

* `node['mysql_connector']['j']['version']` - Version of MySQL Connector/J to
  install.
* `node['mysql_connector']['j']['url']` - URL for MySQL Connector/J, defaults to
  "http://cdn.mysql.com/Downloads/Connector-J/mysql-connector-java-#{node['mysql_connector']['j']['version']}.tar.gz"
* `node['mysql_connector']['j']['checksum']` - SHA256 checksum for MySQL
  Connector/J

## Recipes

* `recipe[mysql_connector]` empty recipe for including LWRPs
* `recipe[mysql_connector::odbc_package]` will install MySQL Connector/ODBC from
  package.

## Usage

### MySQL Connector/J

Provided via LWRP because requires installation path.

* Add `depends "mysql_connector"` to cookbook metadata
* Add to cookbook recipe:
```ruby
include_recipe "mysql-connector"
mysql_connector_j "/path/to/install/location"
```
