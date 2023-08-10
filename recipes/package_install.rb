apt_package './code_1.58.2-1626300392_arm64.deb ' do
  action :install
end

apt_package 'apt-transport-https' do
end

execute 'sudo update' do
  command 'sudo apt update'
end

apt_package 'code' do
end
