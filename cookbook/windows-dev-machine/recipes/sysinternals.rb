# Sysinternals
url = node['sysinternals']['url']
path = node['sysinternals']['path']
cksum = node['sysinternals']['checksum']
check_file = "PsExec.exe"

windows_zipfile path do
  action :unzip
  not_if {::File.exists?("#{path}/#{check_file}")}
  source url
  checksum cksum
end

windows_path(path) { action :add }

