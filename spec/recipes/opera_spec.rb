require 'spec_helper'

describe 'selenium-webdriver::opera' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new do |node|
      node.default['selenium']['opera']['version'] = "last"
      node.default['selenium']['opera']['maxInstances'] = "5"
    end.converge(described_recipe)
  end

  it 'include selenium-webdriver::default' do
    expect(chef_run).to include_recipe('selenium-webdriver::default')
  end

  it 'include selenium-webdriver::addrepos' do
    expect(chef_run).to include_recipe('selenium-webdriver::addrepos')
  end

  it 'installs opera' do
    expect(chef_run).to install_package('opera')
  end
end