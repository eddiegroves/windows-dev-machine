My personal windows development machine setup that uses Chef with my win-dev cookbook.

## Setup From Scratch

### Install Chef for Windows

[Chef installer](http://opscode.com/chef/install.msi)

### Open an *elevated* Powershell prompt and download this repository
    
    mkdir C:\home\; cd C:\home\
    (New-Object Net.WebClient).DownloadFile('https://github.com/eddiegroves/windows-dev-machine/archive/master.zip',
     "$((Get-Location).Path)\windows-dev-machine.zip")
    tar xf .\windows-dev-machine.zip
    cd .\windows-dev-machine-master

The above should create a temp working directory, download the repository (fresh 
machine won't have git yet) and unzip. Handily `tar` comes via the Chef installer. 

### Get ruby dependencies

    bundle install

### Get cookbook dependencies

    berks install --path ./cookbooks

### Run Chef

    chef-solo -c ./solo.rb -j ./node.json

## Requirements

Dotfiles requires a valid SSH key configured with Github.
Using putty tools for example:

    http://the.earth.li/~sgtatham/putty/latest/x86/pageant.exe
    (New-Object Net.WebClient).DownloadFile('http://the.earth.li/~sgtatham/putty/latest/x86/pageant.exe',
     "$((Get-Location).Path)\pageant.exe")
    (New-Object Net.WebClient).DownloadFile('http://the.earth.li/~sgtatham/putty/latest/x86/puttygen.exe', 
     "$((Get-Location).Path)\pageant.exe")

## Tips

**Generate a file checksum with Powershell Community Extensions**

By providing a checksum for remote files, Chef can skip downloading the file if
it already exists in cache.

    (Get-Hash -Algorithm SHA256 <file path>).HashString.ToLower()

## Uses

* Chef
* Berkshelf
