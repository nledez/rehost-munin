#
# Cookbook Name:: rehost-munin
# Recipe:: memcached
#
# Copyright 2013, ReHost
#
# All rights reserved - Do Not Redistribute
#

include_recipe "rehost-munin"

node['rehost-munin']['packages-memcached'].each do |pkg|
  package pkg do
    action :install
  end
end

link "/etc/munin/plugins/memcached_bytes" do
  to "/usr/share/munin/plugins/memcached_"
  notifies :restart, "service[#{node['rehost-munin']['munin-node']}]"
  action :create
end

link "/etc/munin/plugins/memcached_counters" do
  to "/usr/share/munin/plugins/memcached_"
  notifies :restart, "service[#{node['rehost-munin']['munin-node']}]"
  action :create
end

link "/etc/munin/plugins/memcached_rates" do
  to "/usr/share/munin/plugins/memcached_"
  notifies :restart, "service[#{node['rehost-munin']['munin-node']}]"
  action :create
end
