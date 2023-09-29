
control 'configure_chromium' do
  describe directory '/home/dsusilo/snap' do
    it { should exist }
  end
end
