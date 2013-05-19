install_path = node['dotfiles']['path']
url = node['dotfiles']['url']

windows_batch 'trust github' do
    code <<-EOH
    echo y | plink git@github.com
    exit /b 0
    EOH
    not_if { File.exists?(File.join(ENV['HOME'], '.ssh/known_hosts')) }
end

execute 'download dotfiles' do
    cwd node['git']['path']
    command "git.exe clone #{url} #{install_path}"
    not_if { File.directory?(install_path) }
end

