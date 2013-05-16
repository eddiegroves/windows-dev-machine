# Sysinternals
url = node['sysinternals']['path']
path = node['sysinternals']['path']
check_file = "PsExec.exe"

windows_zipfile path do
  source url
  action :unzip
  not_if {::File.exists?("#{path}/#{check_file}")}
end

windows_path path do
    action :add
end

