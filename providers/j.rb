action :create do
  remote_file "#{Chef::Config[:file_cache_path]}/#{version_tar_file}" do
    source version_url
    checksum version_checksum
  end

  execute "mysql-connector-java-#{new_resource.path}" do
    cwd Chef::Config[:file_cache_path]
    command "tar --strip-components=1 -xzf #{version_tar_file} -C #{new_resource.path} #{version_archive_jar_file}"
    creates "#{new_resource.path}/#{version_jar_file}"
  end

  new_resource.updated_by_last_action(true)
end

def url_exists?(test_url)
  require 'net/http'
  uri = URI.parse(test_url)
  req = Net::HTTP.new(uri.host, uri.port)
  res = req.request_head(uri.path)
  res.code != '404'
end

def version
  new_resource.version
end

def version_checksum
  new_resource.checksum ||
    case version
    when /^5.0/ then version_checksum_5_0
    when /^5.1/ then version_checksum_5_1
    else version_checksum_not_found
    end
end

def version_checksum_5_0
  case version
  when '5.0.8' then '660a0e2a2c88a5fe65f1c5baadb20535095d367bc3688e7248a622f4e71ad68d'
  else version_checksum_not_found
  end
end

# rubocop:disable Metrics/CyclomaticComplexity
def version_checksum_5_1
  case version
  when '5.1.26' then 'fade4caa398c41f537d9b7bcaf83aabaa1eab1ef23c81de49979b5b04ba395bd'
  when '5.1.27' then 'a00f8d1524ba211e6d714c23fe79735883bd38fb4c73aabc0706fe3e65221073'
  when '5.1.28' then '93057e410ef5ae529e35ade6b517acbec41e30e2c3ecf08a891d1a2ef712337c'
  when '5.1.29' then '04ad83b655066b626daaabb9676a00f6b4bc43f0c234cbafafac1209dcf1be73'
  when '5.1.30' then '1986baca293f998f9ecfe8a56e6e832825048a9c466cc5b5ed91940407f1210d'
  when '5.1.31' then '5a253a2aa8f06758c1901c3862402c69db601e9de456864ab1922955b225bba6'
  when '5.1.32' then '736090d56de1e3fa97ff5f57ead504a23c88f608a0fd186dfc2565b85f95a82a'
  when '5.1.33' then '0106bfd474bfbe64b74c019352a7025909551ab4935557f1539540d5db00b2a7'
  when '5.1.34' then 'eb33f5e77bab05b6b27f709da3060302bf1d960fad5ddaaa68c199a72102cc5f'
  when '5.1.35' then 'fa77909a62363c1aa49ef5ab537ed4affe90a4a6aa5dd1045555b16b2611306d'
  when '5.1.36' then '2e8ae92c68e719732ff5d75dc7e50f2d893d5e8efd65e5c0acb372291a8fd114'
  else version_checksum_not_found
  end
end
# rubocop:enable Metrics/CyclomaticComplexity

def version_checksum_not_found
  Chef::Log.warn <<-EOM

    Security risk: download checksum for mysql_connector_j version: #{version}
      * Not auto-detected by provider
      * Not set via attribute ['mysql_connector']['j']['checksum']
    Provider defaulted to nil (not checked) and proceeding.
  EOM
  nil
end

def version_archive_jar_file
  "mysql-connector-java-#{version}/#{version_jar_file}"
end

def version_jar_file
  new_resource.jar_file || "mysql-connector-java-#{version}-bin.jar"
end

def version_tar_file
  new_resource.tar_file || "mysql-connector-java-#{version}.tar.gz"
end

def version_url
  return new_resource.url if new_resource.url
  return version_url_latest if url_exists? version_url_latest
  return version_url_archives if url_exists? version_url_archives
  url_not_found
end

def version_url_latest
  "http://cdn.mysql.com/Downloads/Connector-J/#{version_tar_file}"
end

def version_url_archives
  "http://cdn.mysql.com/archives/mysql-connector-java-5.1/#{version_tar_file}"
end

def version_url_not_found
  fail <<-EOM

    Configuration error: URL for mysql_connector_j version: #{version}
      * Not auto-detected by provider
      * Not set via attribute ['mysql_connector']['j']['url']
    Cannot proceed.
  EOM
end
