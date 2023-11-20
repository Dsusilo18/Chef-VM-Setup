require 'spec_helper'

describe 'vm-setup::dir_creation' do
  platform 'mac_os_x'

  default_attributes['vm-setup']['user_name'] = 'tony'

  it {
    is_expected.to create_dir_file_management('/home').with(
        owner: 'tony'
      )
  }

  it { is_expected.to create_file('/home/tony/.config/gnome-initial-setup-done') }
end
