name              "mysql_connector"
maintainer        "Brian Flad"
maintainer_email  "bflad@wharton.upenn.edu"
license           "Apache 2.0"
description       "Recipes/LWRPs for installing MySQL Connectors."
version           "0.4.1"
recipe            "mysql_connector", "Empty recipe for including LWRPs."
recipe            "mysql_connector::j", "Installs MySQL Connector/J via attribute."
recipe            "mysql_connector::odbc_package", "Installs MySQL Connector/ODBC via package."

#%w{ ark }.each do |d|
#  depends d
#end

%w{ redhat ubuntu }.each do |os|
  supports os
end
