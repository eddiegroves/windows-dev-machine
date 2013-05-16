My personal windows development machine setup that uses Chef with my win-dev cookbook.

## Setup From Scratch

1. Install Chef for Windows

[Chef installer](http://opscode.com/chef/install.msi)

2. Open an **elevated** Powershell prompt and download this repository

    # Create and enter a temp working directory
    mkdir C:\home\; cd C:\home\
    # Download this repository (we're sans git at this point)
    (New-Object Net.WebClient).DownloadFile('https://github.com/eddiegroves/windows-dev-machine/archive/master.zip', "$((Get-Location).Path)\windows-dev-machine.zip")
    # Unzip (should have `tar` via the Chef installer)
    tar xf .\windows-dev-machine.zip
    cd .\windows-dev-machine-master

3. Get ruby dependencies

    bundle install

4. Get cookbook dependencies

    berks install --path ./cookbooks

5. Run Chef

    chef-solo -c ./solo.rb -j ./node.json

## Tips

**Generate a file checksum with Powershell Community Extensions**

By providing a checksum for remote files, Chef can skip downloading the file if
it already exists in cache.

    (Get-Hash -Algorithm SHA256 <file path>).HashString.ToLower()

## Uses

* Chef
* Berkshelf
