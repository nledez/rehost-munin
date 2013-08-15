require 'chefspec'

describe 'rehost-munin::nginx' do
  it 'should deploy a munin nginx' do
    chef_run = ChefSpec::ChefRunner.new
    chef_run.converge 'rehost-munin::nginx'

    runner = expect(chef_run)

    [ "liblwp-useragent-determined-perl" ].each do |p|
      runner.to install_package p
    end

    link = chef_run.link("/etc/munin/plugins/nginx_request")
    expect(link).to link_to "/usr/share/munin/plugins/nginx_request"
    expect(link).to notify "service[munin-node]", :restart

    link = chef_run.link("/etc/munin/plugins/nginx_status")
    expect(link).to link_to "/usr/share/munin/plugins/nginx_status"
    expect(link).to notify "service[munin-node]", :restart
  end
end
