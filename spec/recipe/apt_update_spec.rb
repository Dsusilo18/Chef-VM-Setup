require 'spec_helper'

describe 'vm-setup::apt_update' do
  step_into :apt_update
  platform 'mac_os_x'

  context 'update and install apt for potential ubuntu update' do
    it { is_expected.to run_execute('update && upgrade apt') }
    it { is_expected.to run_execute('dist-upgrade apt') }
    it { is_expected.to run_execute('autoremove') }
    it { is_expected.to run_execute('get install apt') }
  end

  context 'user wants to upgrade to the lastest ubuntu' do
    default_attributes['vm-setup']['upgrade_ubuntu'] = true
    it { is_expected.to run_execute('do-release-upgrade') }
  end

  context 'user does not want to upgrade to the lastest ubuntu' do
    default_attributes['vm-setup']['upgrade_ubuntu'] = false
    it { is_expected.to_not run_execute('do-release-upgrade') }
  end
end
