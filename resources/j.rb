actions :create

attribute :path, :kind_of => String, :name_attribute => true

def initialize(*args)
  super
  @action = :create
end
