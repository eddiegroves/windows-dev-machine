package = node['git']['package']
path = node['git']['path']
url = node['git']['url']
cksum = node['git']['checksum']
bcomp_path = node['bcompare']['path']

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
    command 'git.exe config --global core.autocrlf true'
    only_if { platform?('windows') }
end

execute 'set beyond compare as diff tool' do
    cwd path
    command 'git.exe config --global diff.tool bc3'
end

execute 'set beyond compare difftool path' do
    cwd path
    command "git.exe config --global difftool.bc3.path \"#{bcomp_path}/bcomp.exe\""
    only_if { platform?('windows') }
end

execute 'set beyond compare as merge tool' do
    cwd path
    command 'git.exe config --global merge.tool bc3'
end

execute 'set beyond compare mergetool path' do
    cwd path
    command "git.exe config --global mergetool.bc3.path \"#{bcomp_path}/bcomp.exe\""
    only_if { platform?('windows') }
end

