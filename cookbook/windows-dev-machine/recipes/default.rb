# Sysinternals
url = 'http://download.sysinternals.com/files/SysinternalsSuite.zip'
dir = 'c:/home/sysinternals'

windows_zipfile dir do
  source url
  action :unzip
  not_if {::File.exists?("#{dir}/PsExec.exe")}
end

windows_path dir do
    action :add
end

