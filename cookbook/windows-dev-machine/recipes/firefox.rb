# windows_package does not like spaces in the source
remote_file "#{Chef::Config[:file_cache_path]}/firefox.exe" do
    source URI.encode("http://releases.mozilla.org/pub/mozilla.org/firefox/releases/22.0/win32/en-US/Firefox Setup 22.0.exe")
    checksum 'abb189f17e65e73d61843247ad1af7c997318b7854fa850a04e5f9d9a20cdd03'
end

windows_package 'Mozilla Firefox 22.0 (x86 en-US)' do
    source "#{Chef::Config[:file_cache_path]}/firefox.exe"
    installer_type :custom
    options '-ms'
    action :install
end

