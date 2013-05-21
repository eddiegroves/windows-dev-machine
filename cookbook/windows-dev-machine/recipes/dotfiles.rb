install_path = node['dotfiles']['bin_dir']
url = node['dotfiles']['url']

putty_dir = node['putty']['bin_dir']
windows_batch 'trust github' do
    code <<-EOH
    echo y | plink git@github.com
    exit /b 0
    EOH
    not_if { File.exists?(File.join(ENV['HOME'], '.ssh/known_hosts')) }
    cwd putty_dir
end

git_dir = node['git']['bin_dir']
execute 'download dotfiles' do
    cwd git_dir 
    command "git.exe clone #{url} #{install_path}"
    not_if { File.directory?(install_path) }
end

windows_batch 'symlinks' do
    cwd ENV['home']
    code <<-EOH
    dotfiles\\symlinks.bat
    EOH
end

