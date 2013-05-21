package = node['bcompare']['package']
install_path = node['bcompare']['bin_dir']
url = node['bcompare']['url']
cksum = node['bcompare']['checksum']

windows_package package do
    action :install
    source url
    checksum cksum
    installer_type :inno
end

windows_path install_path do
    action :add
    only_if { ::File.directory?(install_path) }
end

