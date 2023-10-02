user node['vm-setup']['user_name'] do
  uid 1234
  home "/home/#{node['vm-setup']['user_name']}"
  password node['vm-setup']['user_pass']
  shell '/bin/bash'
  action :create
  manage_home true
  gid 'sudo'
end
