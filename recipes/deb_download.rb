# https://code.visualstudio.com/docs/?dv=linuxarm64_deb
# /home/dsusilo/Downloads
remote_file '/home/dsusilo/Downloads/code_1.81.0-1690979901_arm64.deb' do
    source 'https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-arm64'
    action :create
  end
  