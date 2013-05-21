package = node['rubyinstaller']['package']
install_path = node['rubyinstaller']['path']
url = node['rubyinstaller']['url']
cksum = node['rubyinstaller']['checksum']
devkit_path = node['rubydevkit']['path'] 
devkit_url = node['rubydevkit']['url'] 
devkit_cksum = node['rubydevkit']['checksum'] 

windows_package package do
    action :install
    source url
    checksum cksum
end 

remote_file "#{Chef::Config[:file_cache_path]}/devkit.exe" do
    source devkit_url
    checksum devkit_cksum
    not_if { File.directory?(devkit_path) }
end

windows_batch 'unzip self extracting archive' do
    code <<-EOH
    7z.exe x #{Chef::Config[:file_cache_path]}/devkit.exe -o#{devkit_path}
    EOH
    not_if { File.directory?(devkit_path) }
    cwd node['7zip']['path'] 
end

windows_batch 'run devkit init' do
    code <<-EOH
    ruby dk.rb init
    EOH
    cwd devkit_path
    not_if { File.exists?("#{devkit_path}/config.yml") }
end

windows_batch 'run devkit install' do
    code <<-EOH
    ruby dk.rb install
    EOH
    cwd devkit_path
    not_if { File.exists?("#{install_path}/../lib/ruby/site_ruby/devkit.rb") }
end

windows_path(install_path) { action :add }

