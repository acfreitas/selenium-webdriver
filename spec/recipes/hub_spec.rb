require 'chefspec'

describe 'selenium-webdriver::hub' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new do |node|
      node.default['selenium']['hub']['port'] = "4444"
      node.default['selenium']['hub']['host'] = "127.0.0.1"
      node.default['selenium']['hub']['memory'] = "512m"
      node.default['selenium']['hub']['options'] = "-timeout 60 -browserTimeout 120"
    end.converge(described_recipe)
  end

  it 'include selenium-webdriver::default' do
    expect(chef_run).to include_recipe('selenium-webdriver::default')
  end

  before do
    stub_command("grep /etc/init/selenium-hub.conf").and_return(true)
  end

  it 'template /etc/init/selenium-hub.conf' do
    chef_run.template("/etc/init/selenium-hub.conf")
    notify('service[selenium-hub]').to(:restart).delayed
  end
end