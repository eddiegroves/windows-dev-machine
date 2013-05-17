package = node['git']['package']
path = node['git']['path']
url = node['git']['url']
cksum = node['git']['checksum']

windows_package package do
    action :install
    source url
    checksum cksum
end

windows_path(path) { action :add }

# platform specific git config
# .exe needed for running a command on windows
execute 'explicitly set autocrlf behaviour' do
    cwd path
    command "git.exe config --global core.autocrlf true"
    only_if { platform?('windows') }
end

# TODO Merge tool
