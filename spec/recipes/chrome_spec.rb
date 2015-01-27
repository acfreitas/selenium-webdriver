require 'chefspec'

describe 'selenium-webdriver::chrome' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new do |node|
      node.default['selenium']['chromedriver']['version'] = "2.13"
      node.default['selenium']['chromedriver']['installpath'] = "/usr/local/bin"
      node.default['selenium']['chrome']['version'] = "last"
      node.default['selenium']['chrome']['maxInstances'] = "5"
      node.default['selenium']['os_kernel'] = "linux32"
    end.converge(described_recipe)
  end

  it 'include selenium-webdriver::default' do
    expect(chef_run).to include_recipe('selenium-webdriver::default')
  end

  it 'include selenium-webdriver::addrepos' do
    expect(chef_run).to include_recipe('selenium-webdriver::addrepos')
  end

  it 'installs google-chrome-stable' do
    expect(chef_run).to install_package('google-chrome-stable')
  end

  it 'remote_file /tmp/chromedriver_linux32.zip' do
    resource = chef_run.remote_file('/tmp/chromedriver_linux32.zip')
    expect(resource).to notify('execute[unpack chromedriver]').to(:run).immediately
  end

  it 'file /usr/local/binchromedriver' do
    chef_run.remote_file('/usr/local/binchromedriver')
  end
end