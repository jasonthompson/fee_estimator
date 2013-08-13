source 'https://rubygems.org'

group :development do
  gem 'libnotify'
  gem 'rb-inotify'
  gem 'minitest'
  gem 'guard-minitest'
  gem 'minitest-reporters'
  require 'rbconfig'
  if RbConfig::CONFIG['target_os'] =~ /mswin|mingw/i
     gem 'wdm', '>= 0.1.0' 
     gem 'win32console'
  end
end

gem 'OptionParser'
