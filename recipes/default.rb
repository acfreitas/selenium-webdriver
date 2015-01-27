include_recipe 'apt'

%w(
  openjdk-7-jre-headless unzip xvfb
).each do |package_name|
  package package_name do
    action :install
  end
end

user node['selenium']['user'] do
	home "/home/selenium"
	supports :manage_home => true
	action :create
end

directory node['selenium']['logpath'] do
	owner node['selenium']['user']
	recursive true
end

directory node['selenium']['confpath'] do
	owner node['selenium']['user']
	recursive true
end