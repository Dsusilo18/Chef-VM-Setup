# sudo apt install ubuntu-desktop -y
apt_package 'ubuntu-desktop' do
  options '-y'
  action :install
end
# sudo apt install gdm3 -y
apt_package 'gdm3' do
  options '-y'
  action :install
end
# sudo systemctl enable gdm
# execute 'systemctl' do
#     command 'sudo systemctl enable gdm'
# end
# sudo reboot
reboot 'reboot' do
  delay_mins 1
  action :request_reboot
end
