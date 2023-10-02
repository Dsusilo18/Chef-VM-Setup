remote_directory '/home/dsusilo/snap' do
  source 'chromium-config'
  files_mode '0755'
  files_owner node['vm-setup']['user_name']
  owner node['vm-setup']['user_name']
  mode '0755'
  action :create
end
