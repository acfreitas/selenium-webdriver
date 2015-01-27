require 'spec_helper'

describe 'selenium-webdriver::default' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new do |node|
      node.default['selenium']['os_kernel'] = "linux32"
      node.default['selenium']['logpath'] = "/var/log/selenium"
      node.default['selenium']['confpath'] = "/etc/selenium"
      node.default['selenium']['user'] = "selenium"
    end.converge(described_recipe)
  end

  it 'installs update-notifier-common' do
    expect(chef_run).to install_package('update-notifier-common')
  end

  it 'installs openjdk-7-jre-headless' do
    expect(chef_run).to install_package('openjdk-7-jre-headless')
  end

  it 'installs unzip' do
    expect(chef_run).to install_package('unzip')
  end	

  it 'installs xvfb' do
    expect(chef_run).to install_package('xvfb')
  end
end