remote_directory '/home/dsusilo/snap' do
    source 'chromium-config'
    owner 'dsusilo'
    mode '0755'
    action :create
  end

file '/home/dsusilo/snap/chromium/common/chromium/Default/Bookmarks' do
    owner 'dsusilo'
    mode '0755'
    action :touch
  end