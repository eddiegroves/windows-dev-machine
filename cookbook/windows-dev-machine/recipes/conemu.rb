url = node['conemu']['url']
install_path = node['conemu']['bin_dir']
cksum = node['conemu']['checksum']

remote_file "#{Chef::Config[:file_cache_path]}/ConEmuPack.7z" do
    source url
    checksum cksum
    not_if { File.directory?(install_path) }
end

windows_batch 'unzip 7z archive' do
    code <<-EOH
    7z.exe x #{Chef::Config[:file_cache_path]}/ConEmuPack.7z -o#{install_path}
    EOH
    not_if { File.directory?(install_path) }
    cwd Path.program_files('7-Zip')
end

windows_path install_path do
    action :add
    only_if { ::File.directory?(install_path) }
end

