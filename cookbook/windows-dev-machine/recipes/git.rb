package = node['git']['package']
install_path = node['git']['bin_dir']
url = node['git']['url']
cksum = node['git']['checksum']
bcomp_path = node['bcompare']['bin_dir']

windows_package package do
    action :install
    source url
    checksum cksum
end

# platform specific git config
# .exe needed for running a command on windows
execute 'explicitly set autocrlf behaviour' do
    cwd install_path
    command 'git.exe config --global core.autocrlf true'
    only_if { platform?('windows') }
end

execute 'set beyond compare as diff tool' do
    cwd install_path
    command 'git.exe config --global diff.tool bc3'
end

execute 'set beyond compare difftool path' do
    cwd install_path
    command "git.exe config --global difftool.bc3.path \"#{bcomp_path}/bcomp.exe\""
    only_if { platform?('windows') }
end

execute 'set beyond compare as merge tool' do
    cwd install_path
    command 'git.exe config --global merge.tool bc3'
end

execute 'set beyond compare mergetool path' do
    cwd install_path
    command "git.exe config --global mergetool.bc3.path \"#{bcomp_path}/bcomp.exe\""
    only_if { platform?('windows') }
end

windows_path(install_path) { action :add }

