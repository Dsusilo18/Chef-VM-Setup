dpkg_package 'code_1.81.0-1690979901_arm64.deb' do
  source '/home/dsusilo/Downloads/code_1.81.0-1690979901_arm64.deb'
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

execute 'npm install chromix-too' do
  command 'sudo npm install -g chromix-too'
end
