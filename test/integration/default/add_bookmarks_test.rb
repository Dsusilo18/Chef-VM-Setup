control 'add_bookmarks' do
  describe file('/home/dsusilo/snap/chromium/common/chromium/Default/Bookmarks') do
    it { should exist }
    its('content') { should include('bookmark_bar') }
  end
end
