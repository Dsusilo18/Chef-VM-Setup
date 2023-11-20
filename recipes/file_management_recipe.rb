pic_name = node['vm-setup']['background'].match(%r{/([^/]+)$})[1]

file_management 'create base directories' do
  path 'home'
  owner 'vagrant'
  action :create_dir
end

file_management 'create file' do
  path "/Pictures/Background/#{pic_name}"
  source node['vm-setup']['background']
  owner 'vagrant'
  action :create_file
end
