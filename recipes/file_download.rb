# https://code.visualstudio.com/docs/?dv=linuxarm64_deb
# /home/dsusilo/Dwnld
remote_file '/home/dsusilo/Dwnld/code_1.81.0-1690979901_arm64.deb' do
    source 'https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-arm64'
    action :create
end

# https://chromeenterprise.google/browser/download/thank-you/?platform=MAC_DMG&channel=stable&usagestats=0#
remote_file '/home/dsusilo/Dwnld/googlechrome.dmg' do
  source 'https://chromeenterprise.google/browser/download/thank-you/?platform=MAC_DMG&channel=stable&usagestats=0#'
  action :create
end