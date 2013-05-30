url = node['putty']['url']
install_path = node['putty']['bin_dir']
cksum = node['putty']['checksum']
check_file = "putty.exe"

windows_zipfile install_path do
  action :unzip
  not_if {::File.exists?("#{install_path}/#{check_file}")}
  source url
  checksum cksum
end

# Setting git to use putty for ssh
powershell "setting GIT_SSH env var" do
    code <<-EOH
    [Environment]::SetEnvironmentVariable('GIT_SSH', '#{install_path}/plink.exe', 'User')
    EOH
end

if ENV['GIT_SSH'] == nil
    ENV['GIT_SSH'] = "#{install_path}/plink.exe"
end

windows_path(install_path) { action :add }

