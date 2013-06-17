# windows_package does not like spaces in the source
remote_file "#{Chef::Config[:file_cache_path]}/firefox.exe" do
    source URI.encode("http://releases.mozilla.org/pub/mozilla.org/firefox/releases/21.0/win32/en-US/Firefox Setup 21.0.exe")
    checksum '61b8710a01d0de6c53b1e60a9e6a455becef0aae86a2589b5bf57140a3a10f9e'
end

windows_package 'Mozilla Firefox 21.0 (x86 en-US)' do
    source "#{Chef::Config[:file_cache_path]}/firefox.exe"
    installer_type :custom
    options '-ms'
    action :install
end

