include_recipe 'selenium-webdriver::default'
 
directory node['selenium']['server']['installpath']
 
service "xvfb" do
    start_command "sudo Xvfb :99 -ac -screen 0 #{node['selenium']['xvfb']['fbsize']} &"
end
 
service "selenium" do
    start_command "java -jar -Dselenium.LOGGER=#{node['selenium']['logpath']}/selenium-server.log #{node['selenium']['server']['installpath']}/selenium-server-standalone.jar &"
end
 
execute "xvfb" do
    command "sudo Xvfb :99 -ac -screen 0 #{node['selenium']['xvfb']['fbsize']} &"
    command "sudo echo export DISPLAY=:99 >> /etc/profile"
    notifies :start, resources(:service => "xvfb")
    only_if { node['selenium']['xvfb']['display'] == "false"}
end
 
remote_file File.join(node['selenium']['server']['installpath'], 'selenium-server-standalone.jar') do
	source "http://selenium-release.storage.googleapis.com/#{node['selenium']['server']['version']}/selenium-server-standalone-#{node['selenium']['server']['version']}.0.jar"
	action :create
	mode 0755
	notifies :start, resources(:service => "selenium")
end