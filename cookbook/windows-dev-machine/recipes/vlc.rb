windows_package 'VLC media player 2.0.7' do
  source 'http://get.videolan.org/vlc/2.0.7/win32/vlc-2.0.7-win32.exe'
  checksum '08d55bec78e1328dd9f31f01d5d022c026bd8439fd2bf00d95cb4a409eb85747'
  installer_type :custom
  options '/S'
  action :install
end

