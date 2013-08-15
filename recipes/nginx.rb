#
# Cookbook Name:: rehost-munin
# Recipe:: nginx
#
# Copyright 2013, ReHost
#
# All rights reserved - Do Not Redistribute
#

node['rehost-munin']['packages-nginx'].each do |pkg|
  package pkg do
    action :install
  end
end

link "/etc/munin/plugins/nginx_request" do
  to "/usr/share/munin/plugins/nginx_request"
end

link "/etc/munin/plugins/nginx_status" do
  to "/usr/share/munin/plugins/nginx_status"
end
