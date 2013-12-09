# Helpers module
module Helpers
  # Helpers::MysqlConnector module
  module MysqlConnector
    include MiniTest::Chef::Assertions
    include MiniTest::Chef::Context
    include MiniTest::Chef::Resources
  end
end
