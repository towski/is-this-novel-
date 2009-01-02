require 'rubygems'
require 'dm-core'

namespace :db do
  desc "Setup connection."
  task :connect do
		DataMapper.setup(:default, "sqlite3:///Users/matt/entp/isthisnovel/isthisnovel.db")
  end

  desc "Automigrate the database"
  task :migrate => :connect do
    require "lib/novelty"
    DataMapper.auto_migrate!
  end
end
