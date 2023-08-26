remote_directory '/home/dsusilo/snap' do
    source 'chromium-config'
    owner 'dsusilo'
    mode '0755'
    action :create
  end

Dir.glob('/home/dsusilo/snap/**/*.txt').each do |file_path|
  file file_path do
    owner 'dsusilo'
    mode '0755'
  end
end