require 'spec_helper'

describe 'mysql_connector::j' do
  let(:chef_run) do
    ChefSpec::Runner.new.converge(described_recipe)
  end
end
