remote_file "#{Chef::Config[:file_cache_path]}/dropbox.exe" do
    source URI.encode('https://d1ilhw0800yew8.cloudfront.net/client/Dropbox 2.2.8.exe')
    checksum '0c090dee25de52c4170e9efe47cfc6d3b78bb39cec158b00d2a84bc070632734'
end

windows_package 'Dropbox' do
    source "#{Chef::Config[:file_cache_path]}/dropbox.exe"
    version '2.2.8'
    installer_type :custom
    options '/S'
    action :install
end

