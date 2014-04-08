require 'spec_helper'

describe 'mysql_connector::default' do
  let(:chef_run) do
    ChefSpec::Runner.new.converge(described_recipe)
  end
end
