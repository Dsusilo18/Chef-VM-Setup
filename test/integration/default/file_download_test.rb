files = ['/home/dsusilo/Downloads/code_1.82.2_arm64.deb', '/home/dsusilo/Pictures/Background/pexels-photo-1543793.jpg',
'/home/dsusilo/Pictures/Background/pexels-photo-16013451.jpg']

control 'file_download' do
  files.each do |downloads|
    describe file(downloads) do
      it { should exist }
    end
  end
end
