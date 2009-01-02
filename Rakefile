require 'rubygems'
require 'dm-core'
require 'config'

namespace :db do
  desc "Automigrate the database"
  task :migrate do
    require "lib/novelty"
    DataMapper.auto_migrate!
  end
end
