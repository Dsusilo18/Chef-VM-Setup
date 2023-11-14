pic_name = node['vm-setup']['background'].match(%r{/([^/]+)$})[1]

# user node['vm-setup']['user_name'] do
#   uid 1234
#   home "/home/#{node['vm-setup']['user_name']}"
#   password node['vm-setup']['user_pass']
#   shell '/bin/bash'
#   action :create
#   manage_home true
#   gid 'sudo'
# end

file_management 'create the picture file' do
  owner 'vagrant'
  action :create_dir
end

file_management 'create the picture file' do
  path "/Pictures/Background/#{pic_name}"
  source node['vm-setup']['background']
  owner 'vagrant'
  action :create_file
end

