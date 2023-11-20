require 'net/http'

files = node['vm-setup']['files_list']

srcs = node['vm-setup']['source_list']

version = node['vm-setup']['code_version'].gsub('.', '_').slice(0, 4)
uri = URI.parse("https://code.visualstudio.com/updates/v#{version}")
response = Net::HTTP.get_response(uri)
raise "Error: Visual Studio Code version doesn't exist!" unless response.code == '200'

index = 0

while index < files.length()
  file_management files[index] do
    source srcs[index]
    owner node['vm-setup']['user_name']
    action :create_file
  end
  index += 1
end
