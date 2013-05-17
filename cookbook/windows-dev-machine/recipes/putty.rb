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

# Setting git to use putty for ssh
powershell "setting GIT_SSH env var" do
    code <<-EOH
    [Environment]::SetEnvironmentVariable('GIT_SSH', '#{path}/plink.exe', 'User')
    EOH
    only_if {ENV['GIT_SSH'] == nil}
end

