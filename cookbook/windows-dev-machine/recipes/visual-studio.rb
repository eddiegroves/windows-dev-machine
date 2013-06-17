vs_iso = 'D:\discs\visual-studio\visual-studio-2012-ultimate.iso'
vs_update_iso = 'D:\discs\visual-studio\VS2012.2.iso'

windows_batch 'unzip iso' do
    code <<-EOH
    7z.exe x #{vs_iso} -o#{Chef::Config[:file_cache_path]}/visual-studio/
    EOH
    not_if { File.directory?("#{Chef::Config[:file_cache_path]}/visual-studio") }
    cwd Path.program_files('7-Zip')
end

template "#{Chef::Config[:file_cache_path]}/visual-studio/AdminDeployment.xml" do
end

windows_package 'Microsoft Visual Studio Ultimate 2012' do
    source "#{Chef::Config[:file_cache_path]}/visual-studio/vs_ultimate.exe"
    options '/adminfile ./AdminDeployment.xml /quiet /norestart'
    installer_type :custom
    action :install
end

windows_batch 'unzip update iso' do
    code <<-EOH
    7z.exe x #{vs_update_iso} -o#{Chef::Config[:file_cache_path]}/visual-studio-update/
    EOH
    not_if { File.directory?("#{Chef::Config[:file_cache_path]}/visual-studio-update") }
    cwd Path.program_files('7-Zip')
end

windows_package 'Microsoft Visual Studio Ultimate 2012 Update 2' do
    source "#{Chef::Config[:file_cache_path]}/visual-studio-update/VS2012.3.exe"
    options '/quiet /norestart'
    installer_type :custom
    action :install
    not_if { registry_data_exists?(
        'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\DevDiv\vs\Servicing\11.0\devenv\1033',
        { :name => 'UpdateVersion', :type => :string, :data => '11.0.60315' },
        :i386
    )}
end
