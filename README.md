Selenium Webdriver Cookbook
====

## Introduction

This cookbook install the and configure Selenium Server, Selenium Grid, Drivers .

## Requirements

Chef 0.10.10+ for platform_family use.

## Platforms Tested

- Ubuntu 12.04 LTS 32-bit (hashicorp/precise32)

## Installing via chef-solo:

```
$ echo "chef chef/chef_server_url string localhost       
      postfix postfix/main_mailer_type select No configuration " | debconf-set-selections
$ echo "deb http://apt.opscode.com/ precise-0.10 main" > /etc/apt/sources.list.d/opscode.list
$ apt-get update > /dev/null; apt-get install chef git-core
$ mkdir cookbooks && cd cookbooks
$ git clone git://github.com/yandex-qatools/chef-selenium.git selenium
$ mv selenium/recipe.json ../
$ cd ../ && tar czvf chef-solo.tar.gz ./cookbooks
$ chef-solo -j recipe.json -r chef-solo.tar.gz
```

## Recipes

### selenium::addrepos
### selenium::default
### selenium::hub
### selenium::node
### selenium::server

## Drives

### selenium::opera
### selenium::firefox
### selenium::ghostdriver
### selenium::chrome

## Dependencies

- [opscode-cookbooks/apt](https://github.com/opscode-cookbooks/apt)

## More information
Check the [Chef Solo documentation](https://docs.chef.io/chef_solo.html)