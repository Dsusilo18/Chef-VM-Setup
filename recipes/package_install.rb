dpkg_package "code_#{node['vm-setup']['code_version']}_arm64.deb" do
  source "/home/dsusilo/Downloads/code_#{node['vm-setup']['code_version']}_arm64.deb"
  action :install
end

apt_package 'chromium-browser' do
  action :install
end

snap_package 'plexmediaserver' do
  action :install
end

execute 'snap install node' do
  command 'sudo snap install node --classic'
end

execute 'npm install playwright' do
  command 'npm install playwright --prefix /home/dsusilo/Bookmarks'
end

execute 'npx playwright install-deps' do
  command 'npx playwright install-deps'
end
