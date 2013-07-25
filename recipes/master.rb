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

template "/etc/munin/munin.conf" do
  source "munin.conf.erb"
  mode '0440'
  owner 'root'
  group 'root'
  variables({
    :hostname => node['hostname']
  })
end
