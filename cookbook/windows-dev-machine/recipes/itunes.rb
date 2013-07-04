windows_package 'iTunes' do
    source 'http://appldnld.apple.com/iTunes11/091-6060.20130605.Azqw2/iTunes64Setup.exe'
    checksum '5bc1c7b8b30d24937886e744a4572f5079c21e57278a02dfd09e52667823c21d'
    installer_type :custom
    # options '/qn /norestart'
    version '11.0.4.4'
    action :install
end

