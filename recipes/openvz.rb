#
# Cookbook Name:: rehost-munin
# Recipe:: openvz
#
# Copyright 2013, ReHost
#
# All rights reserved - Do Not Redistribute
#

include_recipe "rehost-munin"

[ "vebc_", "vebc-install" ].each do |f|
  cookbook_file "/usr/local/share/munin/plugins/#{f}" do
    source "scripts/#{f}"
    mode '0555'
    owner 'root'
    group 'root'
  end
end
