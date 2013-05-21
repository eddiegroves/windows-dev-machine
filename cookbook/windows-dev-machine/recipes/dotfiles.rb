install_path = node['dotfiles']['bin_dir']
url = node['dotfiles']['url']

windows_batch 'trust github' do
    code <<-EOH
    echo y | plink git@github.com
    exit /b 0
    EOH
    not_if { File.exists?(File.join(ENV['HOME'], '.ssh/known_hosts')) }
    cwd Path.bin('putty')
end

execute 'download dotfiles' do
    cwd Path.program_files('Git/bin', x86 = true)
    command "git.exe clone #{url} #{install_path}"
    not_if { File.directory?(install_path) }
end

windows_batch 'symlinks' do
    cwd ENV['home']
    code <<-EOH
    dotfiles\\symlinks.bat
    EOH
end

