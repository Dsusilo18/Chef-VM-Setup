directory '/home/dsusilo/Dwnld' do
  action :create
end

directory '/home/dsusilo/Background' do
  action :create
end

directory '/home/dsusilo/Bookmarks' do
  action :create
end

to_be_added = ["https://www.youtube.com/@VarunLaohaprasitEnglish", "https://mail.google.com/mail/u/0/#inbox", 
    "https://www.google.com", "https://docs.ruby-lang.org/en/", "https://docs.chef.io/resources/file/", "https://github.com/Dsusilo18"]

file '/home/dsusilo/Bookmarks/list.txt' do
  content to_be_added.join(", ")
  action :create
end

