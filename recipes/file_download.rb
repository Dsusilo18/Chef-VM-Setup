require 'net/http'

files = node['vm-setup']['files_list']

srcs = node['vm-setup']['source_list']

version = node['vm-setup']['code_version'].gsub('.', '_').slice(0, 3)
uri = URI("https://code.visualstudio.com/updates/v#{version}")
response = Net::HTTP.get_response(uri)
raise "Error: Visual Studio Code version doesn't exist!" unless response == '200'

index = 0

while index < files.length()
  remote_file files[index] do
    source srcs[index]
    owner node['vm-setup']['user_name']
    action :create
  end
  index += 1
end
