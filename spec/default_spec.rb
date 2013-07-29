require 'chefspec'

describe 'rehost-munin::default' do
  chef_run = ChefSpec::ChefRunner.new
  chef_run.converge 'rehost-munin::default'

  it 'should deploy a munin node' do
    runner = expect(chef_run)

    [ "munin-node" ].each do |p|
      runner.to install_package p
    end

    runner.to set_service_to_start_on_boot 'munin-node'
    runner.to start_service 'munin-node'

    runner.to create_file "/etc/munin/munin-node.conf"
    file = chef_run.template("/etc/munin/munin-node.conf")
    expect(file).to be_owned_by('root', 'root')
    expect(file.mode).to eq("0440")
    runner.to create_file_with_content "/etc/munin/munin-node.conf", /^allow \^127\\\.0\\\.0\\\.1\$$/
  end

  it "should customize munin-node address" do
    chef_run2 = ChefSpec::ChefRunner.new
    chef_run2.node.set['rehost-munin']['allowed_hosts'] = "192.168.1.1"
    chef_run2.converge 'rehost-munin::default'

    runner = expect(chef_run2)

    runner.to create_file_with_content "/etc/munin/munin-node.conf", /^allow \^192\\\.168\\\.1\\\.1\$$/
  end
end
