<<<<<<< HEAD
dpkg_package "code_#{node['vm-setup']['code_version']}_arm64.deb" do
  source "/home/dsusilo/Downloads/code_#{node['vm-setup']['code_version']}_arm64.deb"
=======
dpkg_package 'code_1.81.0-1690979901_arm64.deb' do
  source "/home/#{node['vm-setup']['user_name']}/Downloads/code_1.81.0-1690979901_arm64.deb"
>>>>>>> 6adb530dc6de1d85eb4ff538178109cd11586040
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
  command "npm install playwright --prefix /home/#{node['vm-setup']['user_name']}/Bookmarks"
end

execute 'npx playwright install-deps' do
  command 'npx playwright install-deps'
end
