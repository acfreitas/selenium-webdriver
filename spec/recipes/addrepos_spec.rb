require 'spec_helper'

describe 'selenium-webdriver::addrepos' do
  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }

  it 'include selenium-webdriver::default' do
    expect(chef_run).to include_recipe('selenium-webdriver::default')
  end

  it 'apt-get update > /dev/null' do
    chef_run.execute('apt-get update > /dev/null')
  end
end