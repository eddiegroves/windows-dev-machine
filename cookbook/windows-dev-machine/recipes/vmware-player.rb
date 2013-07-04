remote_file "#{Chef::Config[:file_cache_path]}/VMware-player.exe" do
    source 'https://download2.vmware.com/software/wkst/VMware-player-5.0.2-1031769.exe?HashKey=974d20a7158ac29e4a93ebd05ee707d4&ext=.exe&params=%7B%22sourcefilesize%22%3A%2276M%22%2C%22dlgcode%22%3A%22PLAYER-502%22%2C%22languagecode%22%3A%22en%22%2C%22source%22%3A%22DOWNLOADS%22%2C%22downloadtype%22%3A%22manual%22%2C%22eula%22%3A%22N%22%2C%22downloaduuid%22%3A%2207b455a0-183e-41df-bc83-b1a472f50d6c%22%2C%22purchased%22%3A%22N%22%2C%22dlgtype%22%3A%22Product+Binaries%22%2C%22productversion%22%3A%225.0.2%22%2C%22productfamily%22%3A%22VMware+Player%22%7D&AuthKey=1372904432_b54d2d6fed238a5f6814a2507f5fe881&ext=.exe'
    checksum '70a418bdbfee539e0a8858979853dee66b0b87ca7520197d03dbef463f283818'
end

windows_package 'VMware Player' do
    source "#{Chef::Config[:file_cache_path]}/VMware-player.exe"
    installer_type :custom
    options '/s /nsr'
    version '5.0.2'
    action :install
end

windows_batch 'VMware Player preferences' do
    code <<-EOH
    echo pref.vmplayer.fullscreen.nobar = "TRUE" >> preferences.ini
    EOH
    cwd "#{ENV['APPDATA']}/VMware"
    not_if { File.readlines("#{ENV['APPDATA']}/VMware/preferences.ini").grep(/nobar/).any? }
end

