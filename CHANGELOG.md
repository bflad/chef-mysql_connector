## 0.8.1

* Bugfix: Correctly handle testing both latest and archives URLs
* Bugfix: Revert ark dependency
* Enhancement: Add J 5.0.8 checksum

## 0.8.0

Please note: this release is broken - use a newer version.

* Enhancement: [#13][]: Use the archive_url for all downloads
  * Also switches back to using ark dependency for simplicity

## 0.7.4

* Update J default version to 5.1.36

## 0.7.3

* Update J default version to 5.1.34

## 0.7.2

* Update J default version to 5.1.31

## 0.7.1

* Bugfix: Workaround remote_file not supporting 404's and utilize archive_url

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

[#13]: https://github.com/bflad/chef-mysql_connector/issues/13
