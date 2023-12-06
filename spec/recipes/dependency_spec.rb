require 'spec_helper'

describe 'vm-setup::dependency' do
  platform 'mac_os_x'

  it 'checks the attributes for validity' do
    expect(subject).to run_ruby_block('check the attribute values')
  end
end
