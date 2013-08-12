require 'chefspec'

describe 'rehost-munin::master' do
  it 'should deploy a munin master' do
    chef_run = ChefSpec::ChefRunner.new
    chef_run.node.automatic_attrs['fqdn'] = 'mon.dummy.tld'
    chef_run.node.set['rehost-munin']['vhost'] = 'munin.dummy.tld'
    chef_run.converge 'rehost-munin::master'

    runner = expect(chef_run)

    [ "munin", "nginx" ].each do |p|
      runner.to install_package p
    end

    runner.to create_file "/etc/munin/munin.conf"
    file = chef_run.template("/etc/munin/munin.conf")
    expect(file).to be_owned_by('root', 'root')
    expect(file.mode).to eq("0440")
    runner.to create_file_with_content "/etc/munin/munin.conf", /^\[mon\.dummy\.tld\]$/

    file = chef_run.template("/etc/nginx/sites-available/munin")
    expect(file).to be_owned_by('root', 'root')
    expect(file.mode).to eq("0444")
    expect(chef_run.link("/etc/nginx/sites-enabled/munin")).to link_to "/etc/nginx/sites-available/munin"
    runner.to create_file_with_content "/etc/nginx/sites-available/munin", /server_name munin\.dummy\.tld;$/
  end

  it "should change munin-master hostname" do
    chef_run2 = ChefSpec::ChefRunner.new
    chef_run2.node.automatic_attrs['fqdn'] = 'dummy.other.mock'
    chef_run2.node.set['rehost-munin']['vhost'] = 'graph.other.mock'
    chef_run2.converge 'rehost-munin::master'

    runner = expect(chef_run2)

    runner.to create_file_with_content "/etc/munin/munin.conf", /^\[dummy\.other\.mock\]$/
    runner.to create_file_with_content "/etc/nginx/sites-available/munin", /server_name graph\.other\.mock;$/
  end
end
