# Sysinternals
url = node['sysinternals']['url']
install_path = node['sysinternals']['bin_dir']
cksum = node['sysinternals']['checksum']
check_file = "PsExec.exe"

windows_zipfile install_path do
  action :unzip
  not_if {::File.exists?("#{install_path}/#{check_file}")}
  source url
  checksum cksum
end

windows_path(install_path) { action :add }

