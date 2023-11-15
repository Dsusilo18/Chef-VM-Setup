require 'spec_helper'

describe 'vm-setup::gui_install' do
  platform 'mac_os_x'

  it 'install ubuntu-desktop -y' do
    expect(subject).to install_apt_package('ubuntu-desktop').with(
          options: ['-y']
        )
  end

  it 'install gdm3 -y' do
    expect(subject).to install_apt_package('gdm3').with(
        options: ['-y']
      )
  end

  context 'reboot since reboot required file exists' do
    before do
      allow(File).to receive(:exist?).and_call_original
      allow(File).to receive(:exist?).with('/var/run/reboot-required').and_return true
    end
    it { is_expected.to request_reboot('my_reboot') }
  end

  context 'do not reboot since reboot required file does not exists' do
    before do
      allow(File).to receive(:exist?).and_call_original
      allow(File).to receive(:exist?).with('/var/run/reboot-required').and_return false
    end
    it { is_expected.to_not request_reboot('my_reboot') }
  end
end
