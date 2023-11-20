require 'spec_helper'

describe 'vm-setup::configure_plex' do
  platform 'mac_os_x'

  context 'create preferences.xml by using a template' do
    it {
      is_expected.to create_template('/var/snap/plexmediaserver/common/Library/Application Support/Plex Media Server/Preferences.xml')
        .with(source: 'Preferences.xml.erb',
            owner: 'dsusilo',
            mode: '0644')
    }

    it 'should contain the correct library path' do
      expect(subject).to render_file('/var/snap/plexmediaserver/common/Library/Application Support/Plex Media Server/Preferences.xml')
        .with_content('/home/dsusilo/Pictures/Background')
    end
  end

  it { is_expected.to run_execute('restart plex') }
end
