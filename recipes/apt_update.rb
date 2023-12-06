execute 'update && upgrade apt' do
  command 'sudo apt-get update && sudo apt-get upgrade -y'
end

execute 'dist-upgrade apt' do
  command 'sudo apt-get dist-upgrade -y'
end

execute 'autoremove' do
  command 'sudo apt-get autoremove'
end

execute 'get install apt' do
  command 'apt-get install update-manager-core -y'
  user 'root'
  environment(HOME: 'home/root', USER: 'root')
end

if node['vm-setup']['upgrade_ubuntu']
  # Upgrade to the latest Ubuntu which requires some time.
  execute 'do-release-upgrade' do
    command 'sudo do-release-upgrade -f DistUpgradeViewNonInteractive'
  end
end
