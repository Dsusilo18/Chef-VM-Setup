dirs = node['vm-setup']['dirs_list']

dirs.each do |dir|
  directory dir do
    owner 'dsusilo'
    action :create
  end
end

to_be_added = ['https://www.youtube.com/@VarunLaohaprasitEnglish', 'https://mail.google.com/mail/u/0/#inbox',
    'https://www.google.com', 'https://docs.ruby-lang.org/en/', 'https://docs.chef.io/resources/file/', 'https://github.com/Dsusilo18']

file '/home/dsusilo/Bookmarks/list.txt' do
  content to_be_added.join(', ')
  action :create
end

file '/home/dsusilo/.config/gnome-initial-setup-done' do
  action :create
end

