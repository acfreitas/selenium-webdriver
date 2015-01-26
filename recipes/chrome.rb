include_recipe "selenium-webdriver::default"
include_recipe "selenium-webdriver::addrepos"

package "google-chrome-stable" do
  options "--force-yes"
  action :install
end

execute "unpack chromedriver" do
  command "unzip -o /tmp/chromedriver_#{node['selenium']['os_kernel']}.zip -d #{node['selenium']['chromedriver']['installpath']}"
  action :nothing
end

remote_file "/tmp/chromedriver_#{node['selenium']['os_kernel']}.zip" do
  source "http://chromedriver.storage.googleapis.com/#{node['selenium']['chromedriver']['version']}/#{node['selenium']['os_kernel']}.zip"
  action :create
  notifies :run, "execute[unpack chromedriver]", :immediately
end

file File.join(node['selenium']['chromedriver']['installpath'], 'chromedriver') do
  mode 0755
  owner 'root'
  group 'root'
end
