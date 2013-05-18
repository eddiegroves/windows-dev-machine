package = node['dotnetframework']['package']
url = node['dotnetframework']['url']
path = node['dotnetframework']['path']
cksum = node['dotnetframework']['checksum']

windows_package package do
    action :install
    not_if { File.directory?(path) } 
    installer_type :custom
    options '/q /norestart'
    source url
    checksum cksum
end 
