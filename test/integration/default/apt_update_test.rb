control 'apt_update' do
  describe command('sudo apt-get update && sudo apt-get upgrade -y') do
    its('exit_status') { should eq 0 }
  end

  describe command('sudo apt-get dist-upgrade -y') do
    its('exit_status') { should eq 0 }
  end

  describe command('sudo apt-get autoremove') do
    its('exit_status') { should eq 0 }
  end

  describe command('apt-get install update-manager-core -y') do
    its('exit_status') { should eq 0 }
  end

  if node['vm-setup']['upgrade_ubuntu'] == true
    describe command('sudo do-release-upgrade -f DistUpgradeViewNonInteractive') do
      its('exit_status') { should eq 0 }
    end
  end
end
