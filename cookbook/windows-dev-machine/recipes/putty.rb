url = node['putty']['url']
path = node['putty']['path']
cksum = node['putty']['checksum']
check_file = "putty.exe"

windows_zipfile path do
  action :unzip
  not_if {::File.exists?("#{path}/#{check_file}")}
  source url
  checksum cksum
end

windows_path(path) { action :add }

