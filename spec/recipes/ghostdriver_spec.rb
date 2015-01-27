require 'chefspec'

describe 'selenium-webdriver::ghostdriver' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new do |node|
      node.default['selenium']['phantomjs']['installpath'] = "/usr/local/bin"
      node.default['selenium']['phantomjs']['version'] = "1.9.8"
      node.default['selenium']['ghostdriver']['port'] = "4444"
    end.converge(described_recipe)
  end

  it 'include selenium-webdriver::default' do
    expect(chef_run).to include_recipe('selenium-webdriver::default')
  end

  it 'file /tmp/phantomjs-1.9.8-linux-x86_64.tar.bz2' do
    resource = chef_run.remote_file('/tmp/phantomjs-1.9.8-linux-x86_64.tar.bz2')
    expect(resource).to notify('execute[unpack phantomjs]').to(:run).immediately
  end

  before do
    stub_command("grep /etc/init/selenium-ghostdriver.conf").and_return(true)
  end

  it 'template /etc/init/selenium-ghostdriver.conf' do
    chef_run.template("/etc/init/selenium-ghostdriver.conf")
    notify('service[selenium-ghostdriver]').to(:restart).delayed
  end
end