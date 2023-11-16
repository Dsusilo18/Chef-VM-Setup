require 'spec_helper'

describe 'vm-setup::file_download' do
  platform 'mac_os_x'

  context 'vistual studio code version available' do
    default_attributes['vm-setup']['code_version'] = '1.82.2'
    it 'Should not raise an error' do
      expect { subject }.to_not raise_error("Error: Visual Studio Code version doesn't exist!")
    end
  end

  context 'vistual studio code version is not available' do
    default_attributes['vm-setup']['code_version'] = '1.95'
    it 'Should raise an error' do
      expect { subject }.to raise_error("Error: Visual Studio Code version doesn't exist!")
    end
  end
end
