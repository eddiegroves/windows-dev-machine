package = node['rubyinstaller']['package']
url = node['rubyinstaller']['url']
cksum = node['rubyinstaller']['checksum']

windows_package package do
    action :install
    source url
    checksum cksum
end 

