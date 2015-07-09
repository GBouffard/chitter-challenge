require 'data_mapper'

env = ENV['RACK_ENV'] || 'development'
local_env = "postgres://localhost/chitter_#{env}"
DataMapper.setup(:default, ENV['DATABASE_URL'] || local_env)

require_relative 'models/peep'
require_relative 'models/user'
require_relative 'models/comment'

DataMapper.finalize
DataMapper.auto_upgrade!
