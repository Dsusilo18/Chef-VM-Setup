packages = %w(code chromium-browser)

control 'package_install' do
  packages.each do |pack|
    describe package(pack) do
      it { should be_installed }
    end
  end

  describe directory '/snap/plexmediaserver' do
    it { should exist }
  end
end
