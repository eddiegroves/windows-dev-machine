package = node['git']['package']
path = node['git']['path']
url = node['git']['url']
cksum = node['git']['checksum']

windows_package package do
    action :install
    source url
    checksum cksum
end

windows_path path do
    action :add
    only_if { ::File.directory?(path) }
end

