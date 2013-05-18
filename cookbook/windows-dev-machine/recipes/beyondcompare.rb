package = node['bcompare']['package']
install_path = node['bcompare']['path']
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

