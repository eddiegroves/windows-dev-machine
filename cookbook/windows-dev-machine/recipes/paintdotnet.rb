windows_zipfile Chef::Config[:file_cache_path] do
    source 'http://www.dotpdn.com/files/Paint.NET.3.5.10.Install.zip'
    checksum '5a2a55e76c4a4e2295c068f823250547c008b66b05fa042db9d3f56a28802bae'
    not_if { File.exists?("#{Chef::Config[:file_cache_path]}/Paint.NET.3.5.10.Install.exe") }
end

windows_package 'Paint.NET v3.5.10' do
    source "#{Chef::Config[:file_cache_path]}/Paint.NET.3.5.10.Install.exe"
    action :install
end

