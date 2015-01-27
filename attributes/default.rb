default['selenium']['os_kernel'] = "linux32"
default['selenium']['logpath'] = "/var/log/selenium"
default['selenium']['confpath'] = "/etc/selenium"
default['selenium']['user'] = "selenium"

default['selenium']['server']['version'] = "2.44"
default['selenium']['server']['installpath'] = "/usr/share/selenium"

default['selenium']['xvfb']['fbsize'] = "1280x1024x24"
default['selenium']['xvfb']['display'] = "false"

default['selenium']['node']['port'] = "5555"
default['selenium']['node']['memory'] = "256m"

default['selenium']['hub']['port'] = "4444"
default['selenium']['hub']['host'] = "127.0.0.1"
default['selenium']['hub']['memory'] = "512m"
default['selenium']['hub']['options'] = "-timeout 60 -browserTimeout 120"

default['selenium']['chrome']['version'] = "last"
default['selenium']['chrome']['maxInstances'] = "5"
default['selenium']['chromedriver']['version'] = "2.13"
default['selenium']['chromedriver']['installpath'] = "/usr/local/bin"

default['selenium']['phantomjs']['installpath'] = "/usr/local/bin"
default['selenium']['phantomjs']['version'] = "1.9.8"
default['selenium']['ghostdriver']['port'] = "4444"

default['selenium']['firefox']['version'] = "last"
default['selenium']['firefox']['maxInstances'] = "5"

default['selenium']['opera']['version'] = "last"
default['selenium']['opera']['maxInstances'] = "5"

default['selenium']['htmlunit']['version'] = "firefox"
default['selenium']['htmlunit']['maxInstances'] = "5"