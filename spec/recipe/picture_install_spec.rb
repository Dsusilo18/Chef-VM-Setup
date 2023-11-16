require 'spec_helper'

describe 'vm-setup::picture_install' do
  platform 'mac_os_x'

  default_attributes['vm-setup']['background'] = 'www.google.com/Cute-Picture'
  default_attributes['vm-setup']['user_name'] = 'tony'

  it {
    is_expected.to create_file_file_management('create the picture file').with(
        path: '/Pictures/Background/Cute-Picture',
        source: 'www.google.com/Cute-Picture',
        owner: 'tony'
      )
  }

  it {
    is_expected.to run_execute('gsettings').with(
        command: 'sudo -Hu tony dbus-launch gsettings set org.gnome.desktop.background picture-uri file:////home/tony/Pictures/Background/Cute-Picture'
      )
  }
end
