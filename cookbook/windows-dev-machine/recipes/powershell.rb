powershell 'write powershell version' do
    code <<-EOH
        Set-Content -Encoding Ascii -Value $PSVersionTable.PSVersion.Major -Path "#{Chef::Config[:file_cache_path]}/ps-version.txt"
    EOH
end

windows_package 'Windows PowerShell 3.0' do
    source 'http://download.microsoft.com/download/E/7/6/E76850B8-DA6E-4FF5-8CCE-A24FC513FD16/Windows6.1-KB2506143-x64.msu'
    installer_type :custom
    options '/quiet /norestart'
    action :install
    only_if { File.read("#{Chef::Config[:file_cache_path]}/ps-version.txt").include?('2') }
end
