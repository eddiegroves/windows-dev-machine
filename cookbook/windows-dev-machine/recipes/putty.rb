url = node['putty']['url']
install_path = node['putty']['path']
cksum = node['putty']['checksum']
check_file = "putty.exe"

windows_zipfile install_path do
  action :unzip
  not_if {::File.exists?("#{install_path}/#{check_file}")}
  source url
  checksum cksum
end

windows_path(install_path) { action :add }

# Setting git to use putty for ssh
powershell "setting GIT_SSH env var" do
    code <<-EOH
    [Environment]::SetEnvironmentVariable('GIT_SSH', '#{install_path}/plink.exe', 'User')
    EOH
    only_if {ENV['GIT_SSH'] == nil}
end
