#
# Cookbook Name:: rehost-munin
# Recipe:: default
#
# Copyright 2013, ReHost
#
# All rights reserved - Do Not Redistribute
#

default['rehost-munin']['packages'] = %w{munin-node}
default['rehost-munin']['packages-master'] = %w{munin nginx apache2-utils}
default['rehost-munin']['packages-nginx'] = %w{liblwp-useragent-determined-perl}
default['rehost-munin']['packages-memcached'] = %w{munin-plugins-extra libcache-memcached-perl}
default['rehost-munin']['packages-postgres'] = %w{libdbd-pg-perl}
default['rehost-munin']['munin-node'] = "munin-node"
default['rehost-munin']['allowed_host'] = "127.0.0.1"
default['rehost-munin']['vhost'] = "munin.localhost"
default['rehost-munin']['nginx-service'] = "nginx"
