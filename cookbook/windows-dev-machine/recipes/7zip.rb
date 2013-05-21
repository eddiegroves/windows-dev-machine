package = node['7zip']['package']
install_path = node['7zip']['bin_dir']
url = node['7zip']['url']
cksum = node['7zip']['checksum']

windows_package package do
    action :install
    source url
    checksum cksum
end

windows_path install_path do
    action :add
    only_if { ::File.directory?(install_path) }
end

