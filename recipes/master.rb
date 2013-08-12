#
# Cookbook Name:: rehost-munin
# Recipe:: master
#
# Copyright 2013, ReHost
#
# All rights reserved - Do Not Redistribute
#

node['rehost-munin']['packages-master'].each do |pkg|
  package pkg do
    action :install
  end
end

service node['rehost-munin']['nginx-service'] do
  action [:start, :enable]
end

template "/etc/munin/munin.conf" do
  source "munin.conf.erb"
  mode '0440'
  owner 'root'
  group 'root'
  variables({
    :hostname => node['fqdn']
  })
end

template "/etc/nginx/sites-available/munin" do
  source "munin.nginx.erb"
  mode '0444'
  owner 'root'
  group 'root'
  variables({
    :vhost => node['rehost-munin']['vhost']
  })
end

link "/etc/nginx/sites-enabled/munin" do
  to "/etc/nginx/sites-available/munin"
end
