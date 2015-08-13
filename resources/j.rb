actions :create

attribute :path, :kind_of => String, :name_attribute => true

# All of these will attempt to auto-detect based on version
attribute :checksum, :kind_of => String, :default => node['mysql_connector']['j']['checksum']
attribute :jar_file, :kind_of => String, :default => node['mysql_connector']['j']['jar_file']
attribute :tar_file, :kind_of => String, :default => node['mysql_connector']['j']['tar_file']
attribute :url, :kind_of => String, :default => node['mysql_connector']['j']['url']
attribute :version, :kind_of => String, :default => node['mysql_connector']['j']['version']

def initialize(*args)
  super
  @action = :create
end
