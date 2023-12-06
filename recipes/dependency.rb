ruby_block 'check the attribute values' do
  block do
    if node['vm-setup']['bookmark_url_list'] == node['vm-setup']['bookmark_name_list']
      raise 'ERROR: bookmark url list in attributes must not be empty.'
    elsif node['vm-setup']['user_name'] == node['vm-setup']['user_pass']
      raise 'ERROR: user name in attributes must not be empty.'
    elsif node['vm-setup']['files_list'] == node['vm-setup']['source_list']
      raise 'ERROR: files list in attributes must not be empty.'
    elsif node['vm-setup']['upgrade_ubuntu'].nil?
      raise 'ERROR: flag to upgrade ubuntu must be a boolean.'
    elsif node['vm-setup']['bookmark_url_list'].empty? || node['vm-setup']['bookmark_name_list'].empty?
      raise 'ERROR: bookmark url list and bookmark name list in attributes must not be empty arrays.'
    elsif node['vm-setup']['code_version'].empty? || node['vm-setup']['background'].empty?
      raise 'ERROR: code version and background must not be empty Strings.'
    elsif node['vm-setup']['user_name'].empty? || node['vm-setup']['user_pass'].empty?
      raise 'ERROR: user name and pass in attributes must not be empty Strings.'
    elsif node['vm-setup']['files_list'].empty? || node['vm-setup']['source_list'].empty?
      raise 'ERROR: files list and source list in attributes must not be empty arrays.'
    end
  end
end
