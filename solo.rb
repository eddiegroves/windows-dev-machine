cookbook_path [
    # My custom cookbook location
    File.expand_path(File.join(File.dirname(__FILE__), 'cookbook')),
    # Where berkshelf will put downloaded cookbooks
    File.expand_path(File.join(File.dirname(__FILE__), 'cookbooks'))
]

log_level :fatal
