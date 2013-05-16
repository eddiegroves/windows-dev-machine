default['home'] = 'c:/home'
default['bin'] = File.join(default['home'], 'bin')

def in_home(path)
  File.join(node['home'], path)
end

def in_bin(path)
  File.join(node['bin'], path)
end

