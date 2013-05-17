package = node['7zip']['package']
path = node['7zip']['path']
url = node['7zip']['url']
cksum = node['7zip']['checksum']

windows_package package do
    action :install
    source url
    checksum cksum
end

windows_path path do
    action :add
    only_if { ::File.directory?(path) }
end

