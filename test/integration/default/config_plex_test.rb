control 'configure_plex' do
  pref_xml_content = file('/var/snap/plexmediaserver/common/Library/Application Support/Plex Media Server/Preferences.xml').content

  describe pref_xml_content do
    it { should include('/home/dsusilo/Pictures/Background') }
  end
end
