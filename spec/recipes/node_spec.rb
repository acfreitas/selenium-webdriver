require 'chefspec'

describe 'selenium-webdriver::node' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new do |node|
      node.default['selenium']['node']['port'] = "5555"
      node.default['selenium']['node']['memory'] = "256m"
    end.converge(described_recipe)
  end

  it 'include selenium-webdriver::default' do
    expect(chef_run).to include_recipe('selenium-webdriver::default')
  end

  before do
    stub_command("grep /etc/selenium/node.json").and_return(true)
  end

  before do
    stub_command("grep /etc/init/selenium-node.conf").and_return(true)
  end

  it 'template /etc/selenium/node.json' do
    chef_run.template("/etc/selenium/node.json")
    notify('service[selenium-node]').to(:restart).delayed
  end

  it 'template /etc/init/selenium-node.conf' do
    chef_run.template("/etc/init/selenium-node.conf")
    notify('service[selenium-node]').to(:restart).delayed
  end
end