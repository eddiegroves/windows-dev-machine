# Misc programs for bin

windows_path(Path.bin('')) { action :add }

remote_file Path.bin('img-tag.exe') do
    source 'http://github.com/eddiegroves/img-tag/releases/v0.2/2687/img-tag.exe'
    action :create
end

