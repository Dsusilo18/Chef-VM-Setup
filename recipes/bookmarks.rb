require 'json'

file_path = '~/.chef/cookbooks/Chef-VM-Setup/files/default/chromium-config/chromium/common/chromium/Default/Bookmarks'

item_to_add = "hi"
existing_content = `cat #{file_path}`

begin
  existing_json = JSON.parse(existing_content)
rescue JSON::ParserError
  existing_json = {}
end

if existing_json["roots"] && existing_json["roots"]["bookmark_bar"]
  existing_json["roots"]["bookmark_bar"]["children"] << item_to_add
  updated_content = JSON.generate(existing_json)
  `echo "#{updated_content}" | sudo tee #{file_path}`
else
  puts "This is the pwd: #{Dir.pwd}"
  raise 'Location marker not found'
end
