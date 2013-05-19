package = node['gvim']['package']
install_path = node['gvim']['path']
url = node['gvim']['url']
cksum = node['gvim']['checksum']

windows_package package do
    action :install
    source url
    checksum cksum
end 

windows_path(install_path) { action :add }

execute 'register vim type library' do
    cwd install_path
    command 'gvim.exe -silent -register'
end

