# dirs = node['vm-setup']['dirs_list']

# dirs.each do |dir|
#   directory dir do
#     owner node['vm-setup']['user_name']
#     action :create
#   end
# end

file_management 'create all the base directories' do
  owner node['vm-setup']['user_name']
  action :create_dir
end

file "/home/#{node['vm-setup']['user_name']}/.config/gnome-initial-setup-done" do
  action :create
end
