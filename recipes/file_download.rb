files = node['test_cookbook']['files_list']

srcs = node['test_cookbook']['source_list']

index = 0

while index < files.length()
  remote_file files[index] do
    source srcs[index]
    owner 'dsusilo'
    action :create
  end
  index += 1
end
