dirs = ['/home/dsusilo/Downloads', '/home/dsusilo/Pictures',
   '/home/dsusilo/Pictures/Background', '/home/dsusilo/Pictures/Icon',
    '/home/dsusilo/Bookmarks']

dirs.each do |dir|
  directory dir do
    action :create
  end
end

to_be_added = ["https://www.youtube.com/@VarunLaohaprasitEnglish", "https://mail.google.com/mail/u/0/#inbox", 
    "https://www.google.com", "https://docs.ruby-lang.org/en/", "https://docs.chef.io/resources/file/", "https://github.com/Dsusilo18"]

file '/home/dsusilo/Bookmarks/list.txt' do
  content to_be_added.join(", ")
  action :create
end

