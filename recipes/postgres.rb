#
# Cookbook Name:: rehost-munin
# Recipe:: postgres
#
# Copyright 2013, ReHost
#
# All rights reserved - Do Not Redistribute
#

include_recipe "rehost-munin"

node['rehost-munin']['packages-postgres'].each do |pkg|
  package pkg do
    action :install
  end
end

link "/etc/munin/plugins/postgres_bgwriter" do
  to "/usr/share/munin/plugins/postgres_bgwriter"
  notifies :restart, "service[#{node['rehost-munin']['munin-node']}]"
  action :create
end

link "/etc/munin/plugins/postgres_cache_ALL" do
  to "/usr/share/munin/plugins/postgres_cache_"
  notifies :restart, "service[#{node['rehost-munin']['munin-node']}]"
  action :create
end

link "/etc/munin/plugins/postgres_checkpoints" do
  to "/usr/share/munin/plugins/postgres_checkpoints"
  notifies :restart, "service[#{node['rehost-munin']['munin-node']}]"
  action :create
end

link "/etc/munin/plugins/postgres_connections_ALL" do
  to "/usr/share/munin/plugins/postgres_connections_"
  notifies :restart, "service[#{node['rehost-munin']['munin-node']}]"
  action :create
end

link "/etc/munin/plugins/postgres_connections_db" do
  to "/usr/share/munin/plugins/postgres_connections_db"
  notifies :restart, "service[#{node['rehost-munin']['munin-node']}]"
  action :create
end

link "/etc/munin/plugins/postgres_locks_ALL" do
  to "/usr/share/munin/plugins/postgres_locks_"
  notifies :restart, "service[#{node['rehost-munin']['munin-node']}]"
  action :create
end

link "/etc/munin/plugins/postgres_querylength_ALL" do
  to "/usr/share/munin/plugins/postgres_querylength_"
  notifies :restart, "service[#{node['rehost-munin']['munin-node']}]"
  action :create
end

link "/etc/munin/plugins/postgres_scans_ALL" do
  to "/usr/share/munin/plugins/postgres_scans_"
  notifies :restart, "service[#{node['rehost-munin']['munin-node']}]"
  action :create
end

link "/etc/munin/plugins/postgres_size_ALL" do
  to "/usr/share/munin/plugins/postgres_size_"
  notifies :restart, "service[#{node['rehost-munin']['munin-node']}]"
  action :create
end

link "/etc/munin/plugins/postgres_transactions_ALL" do
  to "/usr/share/munin/plugins/postgres_transactions_"
  notifies :restart, "service[#{node['rehost-munin']['munin-node']}]"
  action :create
end

link "/etc/munin/plugins/postgres_tuples_ALL" do
  to "/usr/share/munin/plugins/postgres_tuples_"
  notifies :restart, "service[#{node['rehost-munin']['munin-node']}]"
  action :create
end

link "/etc/munin/plugins/postgres_users" do
  to "/usr/share/munin/plugins/postgres_users"
  notifies :restart, "service[#{node['rehost-munin']['munin-node']}]"
  action :create
end

link "/etc/munin/plugins/postgres_xlog" do
  to "/usr/share/munin/plugins/postgres_xlog"
  notifies :restart, "service[#{node['rehost-munin']['munin-node']}]"
  action :create
end
