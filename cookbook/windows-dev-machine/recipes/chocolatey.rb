windows_batch 'installing chocolatey' do
    code <<-EOH
    @powershell -NoProfile -ExecutionPolicy Unrestricted -Command "iex ((New-Object Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))"
    EOH
    not_if { File.directory?("#{ENV['systemdrive']}/chocolatey/bin") }
end

windows_path "#{ENV['systemdrive']}/chocolatey/bin" do
    action :add
end

windows_batch "install scriptcs" do
    code <<-EOH
    cinst scriptcs
    EOH
    cwd "#{ENV['systemdrive']}/chocolatey/bin"
    not_if { File.directory?("#{ENV['APPDATA']}/scriptcs") }
end

