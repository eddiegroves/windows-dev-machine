remote_file "#{Chef::Config[:file_cache_path]}/pscx.msi" do
  source 'http://download-codeplex.sec.s-msft.com/Download/Release?ProjectName=pscx&DownloadId=523236&FileTime=129956931861770000&Build=20567'
end

windows_package 'PowerShell Community Extensions 3.0' do
    source "#{Chef::Config[:file_cache_path]}/pscx.msi"
    checksum '570efb5c5507d133de123251d14588ec58ffe906ddcfbda78323d8741823cfbe'
    action :install
end

