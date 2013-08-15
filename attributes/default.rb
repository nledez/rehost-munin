#
# Cookbook Name:: rehost-munin
# Recipe:: default
#
# Copyright 2013, ReHost
#
# All rights reserved - Do Not Redistribute
#

default['rehost-munin']['packages'] = [ "munin-node" ]
default['rehost-munin']['packages-master'] = [ "munin", "nginx", "apache2-utils" ]
default['rehost-munin']['packages-nginx'] = [ "liblwp-useragent-determined-perl" ]
default['rehost-munin']['packages-postgres'] = [ "libdbd-pg-perl" ]
default['rehost-munin']['munin-node'] = "munin-node"
default['rehost-munin']['allowed_host'] = "127.0.0.1"
default['rehost-munin']['vhost'] = "munin.localhost"
default['rehost-munin']['nginx-service'] = "nginx"
