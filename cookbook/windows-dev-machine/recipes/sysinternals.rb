# Sysinternals
url = node['sysinternals']['url']
path = node['sysinternals']['path']
cksum = node['sysinternals']['checksum']
check_file = "PsExec.exe"

windows_zipfile path do
  source url
  checksum cksum
  action :unzip
  not_if {::File.exists?("#{path}/#{check_file}")}
end

windows_path path do
    action :add
end

