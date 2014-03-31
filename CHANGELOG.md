## 0.7.0

* Enhancement: Update J default version to 5.1.29

## 0.6.0

* Enhancement: New `node['mysql_connector']['j']['archive_url']` attribute and fallback to archive URL downloading (once remote_file actually skips 404's)
* Enhancement: Checksum attribute auto-detection
* Enhancement: Update J default version to 5.1.28

## 0.5.1

* Bugfix: [GH-3] No action remote_file mysql-connector-java-x.x.x.tar.gz

## 0.5.0

* Version bump to add metadata supports amazon, centos, fedora, scientific, ubuntu

## v0.4.1

* Updated J default version to 5.1.26

## v0.4.0

* Updated J default version to 5.1.24

## v0.3.1

* Fix for J jar extraction

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
