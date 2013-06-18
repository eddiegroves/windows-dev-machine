windows_package 'Microsoft SQL Server 2012 Express LocalDB' do
    source 'http://download.microsoft.com/download/8/D/D/8DD7BDBA-CEF7-4D8E-8C16-D9F69527F909/ENU/x64/SqlLocalDB.MSI'
    checksum '53b0b03fad0aa0c77f24d2c7ee906b2c1a1c66c604a839d53f0289f7c79319f1'
    installer_type :custom
    options '/qn IACCEPTSQLLOCALDBLICENSETERMS=YES'
    action :install
end

