packages = %w(code_1.81.0-1690979901_arm64.deb chromium-browser)

control 'package_install' do
  packages.each do |pack|
    describe package(pack) do
      it { should be_installed }
    end
  end
end