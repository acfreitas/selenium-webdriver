require 'spec_helper'

describe 'selenium-webdriver::firefox' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new do |node|
      node.default['selenium']['firefox']['version'] = "last"
      node.default['selenium']['firefox']['maxInstances'] = "5"
    end.converge(described_recipe)
  end

  it 'include selenium-webdriver::default' do
    expect(chef_run).to include_recipe('selenium-webdriver::default')
  end

  it 'installs firefox' do
    expect(chef_run).to install_package('firefox')
  end
end