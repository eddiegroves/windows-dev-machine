windows_zipfile Path.bin('xunit') do
  action :unzip
  not_if {::File.directory?(Path.bin('xunit')) }
  source 'http://download-codeplex.sec.s-msft.com/Download/Release?ProjectName=xunit&DownloadId=423827&FileTime=129859153262930000&Build=20527'
end

windows_path(Path.bin('xunit')) { action :add }

