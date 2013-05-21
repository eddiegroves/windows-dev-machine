install_path = node['dotfiles']['bin_dir']
url = node['dotfiles']['url']

windows_batch 'trust github' do
    code <<-EOH
    echo y | plink git@github.com
    exit /b 0
    EOH
    not_if { File.exists?(File.join(ENV['HOME'], '.ssh/known_hosts')) }
    cwd node['putty']['bin_dir']
end

execute 'download dotfiles' do
    cwd node['git']['bin_dir']
    command "git.exe clone #{url} #{install_path}"
    not_if { File.directory?(install_path) }
end

windows_batch 'symlinks' do
    cwd ENV['home']
    code <<-EOH
    dotfiles\\symlinks.bat
    EOH
end

