pic_name = node['vm-setup']['background'].match(%r{/([^/]+)$})[1]

file_management 'create the picture file' do
  path "/Pictures/Background/#{pic_name}"
  source node['vm-setup']['background']
  owner node['vm-setup']['user_name']
  action :create_file
end

execute 'gsettings' do
  command "sudo -Hu #{node['vm-setup']['user_name']} dbus-launch gsettings set org.gnome.desktop.background picture-uri file:////home/#{node['vm-setup']['user_name']}/Pictures/Background/#{pic_name}"
end
