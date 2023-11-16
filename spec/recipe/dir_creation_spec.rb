require 'spec_helper'

describe 'vm-setup::dir_creation' do
  default_attributes['vm-setup']['user_name'] = 'tony'

  it {
    is_expected.to create_dir_file_management('create all the base directories').with(
        owner: 'tony'
      )
  }

  it { is_expected.to create_file('/home/tony/.config/gnome-initial-setup-done') }
end
