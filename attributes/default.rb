default['vm-setup']['user_name'] = 'dsusilo'
default['vm-setup']['user_pass'] = '$1$5o8FPo4C$5kFNhdltQ84.gKBkPir/l/'

default['vm-setup']['bookmark_name_list'] = %w(neetcode chef)
default['vm-setup']['bookmark_url_list'] = ['https://neetcode.io', 'https://docs.chef.io/resources/user/']

default['vm-setup']['code_version'] = '1.82.2'

default['vm-setup']['files_list'] = ["/Downloads/code_#{node['vm-setup']['code_version']}_arm64.deb",
    '/Pictures/Back/pexels-photo-16013451.jpg']

default['vm-setup']['source_list'] = ["https://update.code.visualstudio.com/#{node['vm-setup']['code_version']}/linux-deb-arm64/stable",
    'https://images.pexels.com/photos/16013451/pexels-photo-16013451.jpeg?cs=srgb&dl=pexels-brokenadmiral-16013451.jpg&fm=jpg&_gl=1*w3c6uc*_ga*NTgyODAzMzAxLjE2OTE3NzM1NDU.*_ga_8JE65Q40S6*MTY5MTc3MzU0NS4xLjEuMTY5MTc3NjE2Ny4wLjAuMA..']

default['vm-setup']['upgrade_ubuntu'] = false
default['vm-setup']['background'] = 'https://images.pexels.com/photos/1543793/pexels-photo-1543793.jpeg'
