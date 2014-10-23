[![Gem Version](https://badge.fury.io/rb/capistrano-strategy-copy-with-triggers.svg)](http://badge.fury.io/rb/capistrano-strategy-copy-with-triggers)
![](http://ruby-gem-downloads-badge.herokuapp.com/capistrano-strategy-copy-with-triggers?type=total)
# Capistrano strategy: Copy with triggers
This recipe for capistrano utilizes the regular copy strategy.
However, it offers some hooks to prepare the build before compression and distribution.


## Installation

```console
gem install 'capistrano-strategy-copy-with-triggers'
```

## Usage

As this recipe does it's own bundling, there is not need to: `require 'bundler/capistrano'`.

All you have to do in your `config/deploy.rb`:

```ruby
require 'capistrano-strategy-copy-with-triggers'
set :deploy_via,    :copy_with_triggers
```

This gem also add a method to retrieve the path of release build directory:

```ruby
set :build_dir      "#{strategy.destinationrelease}"
```

Additionally to that, you can set the usual options when using the regular :copy strategy for capistrano, like:

```ruby
set :copy_cache,    ".cacheCopyDir"         # path where scm update is cached to speed up deploy
set :copy_dir,      ".buildDir"             # path where files are temporarily put before sending them to the servers
set :copy_exclude,  ".git*"                 # we exclude the .git repo so that nobody is able to temper with the release

#Callback triggers to add your own steps within (in order)

on 'strategy:before:compression', 'some:custom:task'
on 'strategy:after:compression',  'some:custom:task'
on 'strategy:before:distribute',  'some:custom:task'
on 'strategy:after:distribute',   'some:custom:task'
```
