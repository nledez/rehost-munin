#
# Cookbook Name:: rehost-munin
# Recipe:: nginx
#
# Copyright 2013, ReHost
#
# All rights reserved - Do Not Redistribute
#

include_recipe "rehost-munin"

node['rehost-munin']['packages-nginx'].each do |pkg|
  package pkg do
    action :install
  end
end

link "/etc/munin/plugins/nginx_request" do
  to "/usr/share/munin/plugins/nginx_request"
  notifies :restart, "service[#{node['rehost-munin']['munin-node']}]"
  action :create
end

link "/etc/munin/plugins/nginx_status" do
  to "/usr/share/munin/plugins/nginx_status"
  notifies :restart, "service[#{node['rehost-munin']['munin-node']}]"
  action :create
end
