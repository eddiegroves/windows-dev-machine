package = node['rubyinstaller']['package']
install_path = node['rubyinstaller']['path']
url = node['rubyinstaller']['url']
cksum = node['rubyinstaller']['checksum']

windows_package package do
    action :install
    source url
    checksum cksum
end 

windows_path(install_path) { action :add }

