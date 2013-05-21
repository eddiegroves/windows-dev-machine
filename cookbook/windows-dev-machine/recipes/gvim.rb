package = node['gvim']['package']
install_path = node['gvim']['bin_dir']
url = node['gvim']['url']
cksum = node['gvim']['checksum']
vundle = File.join(ENV['HOME'], '.vim/bundle/vundle')

windows_package package do
    action :install
    source url
    checksum cksum
end 

execute 'register vim type library' do
    cwd install_path
    command 'gvim.exe -silent -register'
end

git_dir = node['git']['bin_dir']
execute 'download vundle' do
    command "git.exe clone https://github.com/gmarik/vundle.git #{vundle}"
    not_if { File.directory?(vundle) }
    cwd git_dir
end

windows_path(install_path) { action :add }

