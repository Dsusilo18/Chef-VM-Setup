execute 'gsettings' do
  command "sudo -Hu #{node['vm-setup']['user_name']} dbus-launch gsettings set org.gnome.desktop.background picture-uri file:////home/#{node['vm-setup']['user_name']}/Pictures/Background/pexels-cats-coming-1543793.jpg"
end
