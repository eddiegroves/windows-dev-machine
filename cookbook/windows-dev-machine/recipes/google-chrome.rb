windows_package "Google Chrome" do
  source URI.encode('https://dl-ssl.google.com/tag/s/appguid%3D%7B8A69D345-D564-463C-AFF1-A69D9E530F96%7D%26iid%3D%7B806F36C0-CB54-4A84-A3F3-0CF8A86575E0%7D%26usagestats%3D0%26/edgedl/chrome/install/GoogleChromeStandaloneEnterprise.msi')
  action :install
end

