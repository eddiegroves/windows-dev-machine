My personal windows development machine setup that uses Chef with my win-dev cookbook.

## Setup

Get ruby dependencies

    bundle install

Get cookbook dependencies

    berks install --path ./cookbooks

Go!

    chef-solo -c ./solo.rb -j node.json

## Uses

* Chef
* Berkshelf
