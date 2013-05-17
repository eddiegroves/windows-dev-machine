package = node['bcompare']['package']
path = node['bcompare']['path']
url = node['bcompare']['url']
cksum = node['bcompare']['checksum']

windows_package package do
    action :install
    source url
    checksum cksum
    installer_type :inno
end

windows_path path do
    action :add
    only_if { ::File.directory?(path) }
end

