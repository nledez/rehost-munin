#
# Cookbook Name:: rehost-munin
# Recipe:: default
#
# Copyright 2013, ReHost
#
# All rights reserved - Do Not Redistribute
#

default['rehost-munin']['packages'] = [ "munin-node" ]
default['rehost-munin']['packages-master'] = [ "munin" ]
default['rehost-munin']['munin-node'] = "munin-node"
default['rehost-munin']['allowed_host'] = "127.0.0.1"
