require 'spec_helper'

describe 'vm-setup::add_bookmarks' do
  platform 'mac_os_x'

  before do
    allow(File).to receive(:exist?).and_call_original
    allow(File).to receive(:exist?).with('/home/tony/snap/chromium/common/chromium/Default/Bookmarks').and_return true
  end

  default_attributes['vm-setup']['bookmark_url_list'] = 'https://docs.chef.io/resources/user/'
  default_attributes['vm-setup']['bookmark_name_list'] = 'chef'
  default_attributes['vm-setup']['user_name'] = 'tony'

  it 'reads file and generate new content for the new file' do
    expect(subject).to run_ruby_block('read file and generate content')
    expect(subject).to create_file('/home/tony/snap/chromium/common/chromium/Default/Bookmarks')
  end
end
