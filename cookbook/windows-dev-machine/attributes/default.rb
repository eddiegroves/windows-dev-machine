default['home'] = File.join(ENV['SYSTEMDRIVE'], 'home')
default['bin'] = File.join(default['home'], 'bin')

def in_home(path)
  File.join(node['home'], path)
end

def in_bin(path)
  File.join(node['bin'], path)
end

def in_program_files(path, x86 = false)
  program_files = x86 ? 'Program Files (x86)' : 'Program Files'
  File.join(ENV['SYSTEMDRIVE'], program_files, path)
end

def in_home(path)
  File.join(ENV['HOME'], path)
end

