control 'picture_install' do
  describe command('sudo -Hu dsusilo dbus-launch gsettings set org.gnome.desktop.background picture-uri file:////home/dsusilo/Pictures/Background/pexels-cats-coming-1543793.jpg') do
    its('exit_status') { should eq 0 }
  end
end
