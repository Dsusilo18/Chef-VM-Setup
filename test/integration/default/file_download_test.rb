control 'file_download' do
  describe file('/home/dsusilo/Downloads/code_1.81.0-1690979901_arm64.deb') do
    it { should exist }
  end

  describe file('/home/dsusilo/Pictures/Background/pexels-cats-coming-1543793.jpg') do
    it { should exist }
  end

  describe file('/home/dsusilo/Pictures/Background/pexels-photo-16013451.jpeg') do
    it { should exist }
  end
end