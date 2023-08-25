dirs = %w(/home/dsusilo/Downloads /home/dsusilo/Pictures
/home/dsusilo/Pictures/Background /home/dsusilo/Pictures/Icon
/home/dsusilo/Bookmarks)

files = %w(/home/dsusilo/Bookmarks/list.txt
 /home/dsusilo/.config/gnome-initial-setup-done)

control 'dir_creation' do
  dirs.each do |dir|
    describe directory dir do
      it { should exist }
    end
  end

  files.each do |doc|
    describe file(doc) do
      it { should exist }
    end
  end
end
