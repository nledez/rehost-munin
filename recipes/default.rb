#
# Cookbook Name:: rehost-munin
# Recipe:: default
#
# Copyright 2013, ReHost
#
# All rights reserved - Do Not Redistribute
#

node['rehost-munin']['packages'].each do |pkg|
  package pkg do
    action :install
  end
end

service node['rehost-munin']['munin-node'] do
  action [:start, :enable]
end

template "/etc/munin/munin-node.conf" do
  source "munin-node.conf.erb"
  mode '0440'
  owner 'root'
  group 'root'
  variables({
    :allowed_host => node['rehost-munin']['allowed_host']
  })
  notifies :restart, "service[#{node['rehost-munin']['munin-node']}]"
end
