default['rubyinstaller']['package'] = 'Ruby 1.9.3-p429'
default['rubyinstaller']['bin_dir'] = File.join(ENV['SYSTEMDRIVE'], 'Ruby193', 'bin')
default['rubyinstaller']['url'] = 'http://rubyforge.org/frs/download.php/76952/rubyinstaller-1.9.3-p429.exe'
default['rubyinstaller']['checksum'] = '96537a2d45189cc3bbdd850227443630ebaefa75ca9fdd0829953affa4d9fa8c'

default['rubydevkit']['bin_dir'] = File.join(ENV['SYSTEMDRIVE'], 'Ruby193', 'devkit')
default['rubydevkit']['url'] = 'https://github.com/downloads/oneclick/rubyinstaller/DevKit-tdm-32-4.5.2-20111229-1559-sfx.exe'
default['rubydevkit']['checksum'] = '6c3af5487dafda56808baf76edd262b2020b1b25ab86aabf972629f4a6a54491'

