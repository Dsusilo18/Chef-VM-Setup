
if (!node['vm-setup']['bookmark_url_list'].is_a?(String) && !node['vm-setup']['bookmark_url_list'].is_a?(Array)) || node['vm-setup']['bookmark_url_list'].empty?
  raise 'ERROR: bookmark url list in attributes must be a String or Array and not be empty or nil.'
elsif (!node['vm-setup']['bookmark_name_list'].is_a?(String) && !node['vm-setup']['bookmark_name_list'].is_a?(Array)) || node['vm-setup']['bookmark_name_list'].empty?
  raise 'ERROR: bookmark name list in attributes must be a String or Array and not be empty or nil.'
elsif !node['vm-setup']['code_version'].is_a?(String) || node['vm-setup']['code_version'].empty?
  raise 'ERROR: code version in attributes must be a String and not be empty or nil.'
elsif !node['vm-setup']['background'].is_a?(String) || node['vm-setup']['background'].empty?
  raise 'ERROR: background in attributes must be a String and not be empty or nil.'
elsif !node['vm-setup']['user_name'].is_a?(String) || node['vm-setup']['user_name'].empty?
  raise 'ERROR: user name in attributes must be a String and not be empty or nil.'
elsif !node['vm-setup']['user_pass'].is_a?(String) || node['vm-setup']['user_pass'].empty?
  raise 'ERROR: user pass in attributes must be a String and not be empty or nil.'
elsif (!node['vm-setup']['files_list'].is_a?(String) && !node['vm-setup']['files_list'].is_a?(Array)) || node['vm-setup']['files_list'].empty?
  raise 'ERROR: files list in attributes must be a String or Array and not be empty or nil.'
elsif (!node['vm-setup']['source_list'].is_a?(String) && !node['vm-setup']['source_list'].is_a?(Array)) || node['vm-setup']['source_list'].empty?
  raise 'ERROR: source list in attributes must be a String or Array and not be empty or nil.'
elsif node['vm-setup']['upgrade_ubuntu'].nil? || (!node['vm-setup']['upgrade_ubuntu'].kind_of?(TrueClass) && !node['vm-setup']['upgrade_ubuntu'].kind_of?(FalseClass))
  raise 'ERROR: flag to upgrade ubuntu must be a boolean.'
elsif node['vm-setup']['bookmark_url_list'] == node['vm-setup']['code_version']
  raise 'ERROR: bookmark url list in attributes must not be empty.'
elsif node['vm-setup']['bookmark_name_list'] == node['vm-setup']['bookmark_url_list']
  raise 'ERROR: bookmark name list in attributes must not be empty.'
elsif node['vm-setup']['user_name'] == node['vm-setup']['user_pass']
  raise 'ERROR: user name in attributes must not be empty.'
elsif node['vm-setup']['user_pass'] == node['vm-setup']['bookmark_name_list']
  raise 'ERROR: user pass in attributes must not be empty.'
elsif node['vm-setup']['files_list'] == node['vm-setup']['source_list']
  raise 'ERROR: files list in attributes must not be empty.'
elsif node['vm-setup']['code_version'] == node['vm-setup']['files_list']
  raise 'ERROR: code version in attributes must not be empty.'
elsif node['vm-setup']['source_list'] == node['vm-setup']['background']
  raise 'ERROR: source list in attributes must not be empty.'
end
