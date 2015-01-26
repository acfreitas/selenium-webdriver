include_recipe "selenium-webdriver::default"
include_recipe "selenium-webdriver::addrepos"

package "opera" do
	options "--force-yes"
	action :install
end