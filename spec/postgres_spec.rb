require 'chefspec'

describe 'rehost-munin::postgres' do
  it 'should deploy a munin postgres' do
    chef_run = ChefSpec::ChefRunner.new
    chef_run.converge 'rehost-munin::postgres'

    runner = expect(chef_run)

    [ "libdbd-pg-perl" ].each do |p|
      runner.to install_package p
    end

    link = chef_run.link("/etc/munin/plugins/postgres_bgwriter")
    expect(link).to link_to "/usr/share/munin/plugins/postgres_bgwriter"
    expect(link).to notify "service[munin-node]", :restart

    link = chef_run.link("/etc/munin/plugins/postgres_cache_ALL")
    expect(link).to link_to "/usr/share/munin/plugins/postgres_cache_"
    expect(link).to notify "service[munin-node]", :restart

    link = chef_run.link("/etc/munin/plugins/postgres_checkpoints")
    expect(link).to link_to "/usr/share/munin/plugins/postgres_checkpoints"
    expect(link).to notify "service[munin-node]", :restart

    link = chef_run.link("/etc/munin/plugins/postgres_connections_ALL")
    expect(link).to link_to "/usr/share/munin/plugins/postgres_connections_"
    expect(link).to notify "service[munin-node]", :restart

    link = chef_run.link("/etc/munin/plugins/postgres_connections_db")
    expect(link).to link_to "/usr/share/munin/plugins/postgres_connections_db"
    expect(link).to notify "service[munin-node]", :restart

    link = chef_run.link("/etc/munin/plugins/postgres_locks_ALL")
    expect(link).to link_to "/usr/share/munin/plugins/postgres_locks_"
    expect(link).to notify "service[munin-node]", :restart

    link = chef_run.link("/etc/munin/plugins/postgres_querylength_ALL")
    expect(link).to link_to "/usr/share/munin/plugins/postgres_querylength_"
    expect(link).to notify "service[munin-node]", :restart

    link = chef_run.link("/etc/munin/plugins/postgres_scans_ALL")
    expect(link).to link_to "/usr/share/munin/plugins/postgres_scans_"
    expect(link).to notify "service[munin-node]", :restart

    link = chef_run.link("/etc/munin/plugins/postgres_size_ALL")
    expect(link).to link_to "/usr/share/munin/plugins/postgres_size_"
    expect(link).to notify "service[munin-node]", :restart

    link = chef_run.link("/etc/munin/plugins/postgres_transactions_ALL")
    expect(link).to link_to "/usr/share/munin/plugins/postgres_transactions_"
    expect(link).to notify "service[munin-node]", :restart

    link = chef_run.link("/etc/munin/plugins/postgres_tuples_ALL")
    expect(link).to link_to "/usr/share/munin/plugins/postgres_tuples_"
    expect(link).to notify "service[munin-node]", :restart

    link = chef_run.link("/etc/munin/plugins/postgres_users")
    expect(link).to link_to "/usr/share/munin/plugins/postgres_users"
    expect(link).to notify "service[munin-node]", :restart

    link = chef_run.link("/etc/munin/plugins/postgres_xlog")
    expect(link).to link_to "/usr/share/munin/plugins/postgres_xlog"
    expect(link).to notify "service[munin-node]", :restart
  end
end
