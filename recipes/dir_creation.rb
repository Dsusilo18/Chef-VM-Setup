file_management '/home' do
  owner node['vm-setup']['user_name']
  action :create_dir
end

file "/home/#{node['vm-setup']['user_name']}/.config/gnome-initial-setup-done" do
  action :create
end
