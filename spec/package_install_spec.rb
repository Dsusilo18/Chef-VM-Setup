require 'spec_helper'

describe 'vm-setup::package_install' do
  platform 'mac_os_x'

  default_attributes['vm-setup']['code_version'] = '7.7.7'
  default_attributes['vm-setup']['user_name'] = 'stark'

  it 'install package for Visual Studio Code' do
    expect(subject).to install_dpkg_package('code_7.7.7_arm64.deb').with(
        source: '/home/stark/Downloads/code_7.7.7_arm64.deb'
      )
  end

  it { is_expected.to install_apt_package('chromium-browser') }
  it { is_expected.to install_snap_package('plexmediaserver') }
  it { is_expected.to run_execute('snap install node') }
end
