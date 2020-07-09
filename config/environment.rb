require "bundler/setup"
Bundler.require
require "sinatra/activerecord"
require "colorize"

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'
require_all 'utils'

ActiveRecord::Base.logger = nil
