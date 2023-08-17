# firewall_rule 'plex_http' do
#   port 32400
#   protocol :tcp 
#   action :allow 
# end 

template '/var/snap/plexmediaserver/common/Library/Application Support/Plex Media Server/Preferences.xml' do
  source 'Preferences.xml.erb'
  owner 'dsusilo'
  mode '0644'
  variables(
    library_paths: '/home/dsusilo/Pictures/Background'
  )
end

execute 'restart plex' do
  command 'sudo snap restart plexmediaserver'
end
