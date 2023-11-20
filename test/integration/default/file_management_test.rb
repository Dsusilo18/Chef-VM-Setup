control 'file_management' do
  desc 'ensure file have been created'
  describe file('/home/vagrant/Pictures/Background/pexels-photo-1543793.jpeg') do
    it { should exist }
  end
end
