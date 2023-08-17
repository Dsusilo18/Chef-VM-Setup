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
