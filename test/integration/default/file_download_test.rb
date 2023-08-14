files = %w(/home/dsusilo/Downloads/code_1.81.0-1690979901_arm64.deb /home/dsusilo/Pictures/Background/pexels-cats-coming-1543793.jpg 
/home/dsusilo/Pictures/Background/pexels-photo-16013451.jpeg)

control 'file_download' do
  files.each do |downloads| 
    describe file(downloads) do
      it { should exist }
    end
  end
end
