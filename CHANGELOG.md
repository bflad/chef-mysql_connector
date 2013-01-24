## v0.3.0

* Workaround MySQL Connector/J .tar.gz now including extra directory in archive
* ark is no longer a dependency because of J workaround
* Added attribute `node['mysql_connector']['j']['jar_file']`
* Added attribute `node['mysql_connector']['j']['tar_file']`

## v0.2.1

* Bumped J version to 5.1.22

## v0.2.0

* Added mysql_connector::j recipe

## v0.1.0

* Initial release with MySQL Connector/J LWRP.
