require 'spec_helper'

describe 'vm-setup::configure_chromium' do
  platform 'mac_os_x'

  default_attributes['vm-setup']['user_name'] = 'tony'

  it 'create all the files to configure chromium' do
    expect(subject).to create_remote_directory('/home/tony/snap').with(
        source: 'chromium-config',
        files_mode: '0755',
        files_owner: 'tony',
        owner: 'tony',
        mode: '0755'
      )
  end
end
