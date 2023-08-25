packages = %w(code chromium-browser chromix-too)

control 'package_install' do
  packages.each do |pack|
    describe package(pack) do
      it { should be_installed }
    end
  end
end
