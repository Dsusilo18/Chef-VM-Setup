require 'spec_helper'

describe 'vm-setup::file_download' do
  platform 'mac_os_x'

  context 'visual studio code version available' do
    default_attributes['vm-setup']['code_version'] = '1.82.2'
    it 'Should not raise an error' do
      expect { subject }.to_not raise_error
    end
  end

  context 'visual studio code version is not available' do
    default_attributes['vm-setup']['code_version'] = '1.95'
    it 'Should raise an error' do
      expect { subject }.to raise_error('Error: Visual Studio Code version does not exist!')
    end
  end

  context 'create remote files from a list' do
    default_attributes['vm-setup']['files_list'] = ['/Downloads/code_1.82.2_arm64.deb', '/Pictures/Background/pexels-photo-16713451.jpg']
    default_attributes['vm-setup']['source_list'] = ['https://update.code.visualstudio.com/1.82.2/linux-deb-arm64/stable', 'https://images.pexels.com/photos/16713451/pexels-photo-16013451.jpeg']
    default_attributes['vm-setup']['user_name'] = 'tony'

    files = {
        '/Downloads/code_1.82.2_arm64.deb' => 'https://update.code.visualstudio.com/1.82.2/linux-deb-arm64/stable',
        '/Pictures/Background/pexels-photo-16713451.jpg' => 'https://images.pexels.com/photos/16713451/pexels-photo-16013451.jpeg',
    }

    files.each do |file_name, content|
      it {
        is_expected.to create_file_file_management("#{file_name}").with(
        source: content,
        owner: 'tony'
      )
      }
    end
  end
end
