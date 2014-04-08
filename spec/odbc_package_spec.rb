require 'spec_helper'

describe 'mysql_connector::odbc_package' do
  let(:chef_run) do
    ChefSpec::Runner.new.converge(described_recipe)
  end
end
