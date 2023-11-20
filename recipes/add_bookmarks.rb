require 'json'

updated_content = nil

ruby_block 'read file and generate content' do
  block do
    def add_bookmarks(json_file)
      mark_url = node['vm-setup']['bookmark_url_list']
      mark_name = node['vm-setup']['bookmark_name_list']

      index = 0

      while index < mark_name.length()
        item_to_add = { "name": "#{mark_name[index]}", "type": 'url', "url": "#{mark_url[index]}" }
        json_file['roots']['bookmark_bar']['children'] << item_to_add
        index += 1
      end
      json_file
    end

    file_path = "/home/#{node['vm-setup']['user_name']}/snap/chromium/common/chromium/Default/Bookmarks"

    existing_content = ::File.read(file_path) if ::File.exist? file_path

    begin
      existing_json = JSON.parse(existing_content)
    rescue JSON::ParserError
      raise 'File is not in a JSON format!'
    end

    if existing_json['roots']
      updated_content = JSON.generate(add_bookmarks(existing_json))
    else
      raise 'The file does not contain "roots"'
    end
  end
  action :run
end

file "/home/#{node['vm-setup']['user_name']}/snap/chromium/common/chromium/Default/Bookmarks" do
  owner node['vm-setup']['user_name']
  content lazy { updated_content }
end
