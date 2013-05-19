install_path = node['dotfiles']['path']
url = node['dotfiles']['url']

windows_batch 'trust github' do
    code <<-EOH
    echo y | plink git@github.com
    EOH
    not_if { File.directory?(install_path) }
end

execute 'download dotfiles' do
    cwd node['git']['path']
    command "git.exe clone #{url} #{install_path}"
    not_if { File.directory?(install_path) }
end

