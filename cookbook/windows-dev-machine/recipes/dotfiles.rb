install_path = node['dotfiles']['path']
url = node['dotfiles']['url']

execute 'download dotfiles' do
    cwd node['git']['path']
    command "git.exe clone #{url} #{install_path}"
    not_if { File.directory?(install_path) }
end

