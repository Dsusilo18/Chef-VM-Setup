dirs = %w(/home/dsusilo/Downloads /home/dsusilo/Pictures 
/home/dsusilo/Pictures/Background /home/dsusilo/Pictures/Icon 
/home/dsusilo/Bookmarks)

control 'dir_creation' do
  dirs.each do |dir|
    describe directory dir do
      it { should exist }
    end
  end
end