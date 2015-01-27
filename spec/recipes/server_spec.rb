require 'spec_helper'

describe 'selenium-webdriver::server' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new do |node|
      node.default['selenium']['server']['installpath'] = '/usr/share/selenium'
      node.default['selenium']['server']['version'] = "2.44"
    end.converge(described_recipe)
  end

  it 'include selenium-webdriver::default' do
    expect(chef_run).to include_recipe('selenium-webdriver::default')
  end

  it 'file selenium-server-standalone.jar' do
    resource = chef_run.remote_file('/usr/share/selenium/selenium-server-standalone.jar')
    expect(resource).to notify('service[selenium]').to(:start).delayed
  end
end