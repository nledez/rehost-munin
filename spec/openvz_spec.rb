require 'chefspec'

describe 'rehost-munin::openvz' do
  it 'should deploy a munin openvz' do
    chef_run = ChefSpec::ChefRunner.new
    chef_run.converge 'rehost-munin::openvz'

    runner = expect(chef_run)

    runner.to create_cookbook_file "/usr/local/share/munin/plugins/vebc_"
    file = chef_run.cookbook_file("/usr/local/share/munin/plugins/vebc_")
    expect(file).to be_owned_by('root', 'root')
    expect(file.mode).to eq("0555")

    runner.to create_cookbook_file "/usr/local/share/munin/plugins/vebc-install"
    file = chef_run.cookbook_file("/usr/local/share/munin/plugins/vebc-install")
    expect(file).to be_owned_by('root', 'root')
    expect(file.mode).to eq("0555")
  end
end
