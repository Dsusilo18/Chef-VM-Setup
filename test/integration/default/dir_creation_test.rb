dirs = %w(/home/dsusilo/Downloads /home/dsusilo/Pictures
/home/dsusilo/Pictures/Background /home/dsusilo/Pictures/Icon)

control 'dir_creation' do
  dirs.each do |dir|
    describe directory dir do
      it { should exist }
    end
  end

  describe file('/home/dsusilo/.config/gnome-initial-setup-done') do
    it { should exist }
  end
end
