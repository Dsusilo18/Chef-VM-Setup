files = node['vm-setup']['files_list']

srcs = node['vm-setup']['source_list']

index = 0

while index < files.length()
  remote_file files[index] do
    source srcs[index]
    owner node['vm-setup']['user_name']
    action :create
  end
  index += 1
end
