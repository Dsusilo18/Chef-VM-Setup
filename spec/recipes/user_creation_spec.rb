require 'spec_helper'

describe 'vm-setup::user_creation' do
  platform 'mac_os_x'

  default_attributes['vm-setup']['user_name'] = 'tony'
  default_attributes['vm-setup']['user_pass'] = '$1$5o8FPo4C$5kFNhdltQ84.gKBkPir/l/'

  it 'should create a new user' do
    expect(subject).to create_user('tony').with(
        uid: 1234,
        home: '/home/tony',
        password: '$1$5o8FPo4C$5kFNhdltQ84.gKBkPir/l/',
        shell: '/bin/bash',
        manage_home: true,
        gid: 'sudo'
      )
  end
end
