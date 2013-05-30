windows_zipfile Path.bin('xunit') do
  action :unzip
  source 'http://download-codeplex.sec.s-msft.com/Download/Release?ProjectName=xunit&DownloadId=423827&FileTime=129859153262930000&Build=20527'
  checksum 'f76bd2a013606c6c7383ada3e93fce95881bcc033e34754bb391e95a2b5d0fc4'
  not_if {::File.directory?(Path.bin('xunit')) }
end

windows_path(Path.bin('xunit')) { action :add }

