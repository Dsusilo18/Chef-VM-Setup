remote_directory '/home/dsusilo/snap' do
  source 'chromium-config'
  files_mode '0755'
  files_owner 'dsusilo'
  owner 'dsusilo'
  mode '0755'
  action :create
end
