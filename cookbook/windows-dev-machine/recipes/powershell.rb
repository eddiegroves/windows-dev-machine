powershell 'write powershell version' do
    code <<-EOH
        Set-Content -Encoding Ascii -Value $PSVersionTable.PSVersion.Major -Path "#{Chef::Config[:file_cache_path]}/ps-version.txt"
    EOH
end

windows_package 'Windows PowerShell 3.0' do
    source 'http://download.microsoft.com/download/E/7/6/E76850B8-DA6E-4FF5-8CCE-A24FC513FD16/Windows6.1-KB2506143-x64.msu'
    checksum '8a8e35fa0e613fcc54644b8336d7dabbe5c6b57a1895e9caac2d0065746d1f8d'
    installer_type :custom
    options '/quiet /norestart'
    action :install
    only_if { File.read("#{Chef::Config[:file_cache_path]}/ps-version.txt").include?('2') }
end
