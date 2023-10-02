template '/var/snap/plexmediaserver/common/Library/Application Support/Plex Media Server/Preferences.xml' do
  source 'Preferences.xml.erb'
  owner node['vm-setup']['user_name']
  mode '0644'
  variables(
    library_paths: "/home/#{node['vm-setup']['user_name']}/Pictures/Background"
  )
end

execute 'restart plex' do
  command 'sudo snap restart plexmediaserver'
end
