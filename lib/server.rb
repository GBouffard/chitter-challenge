require 'sinatra/base'
require 'data_mapper'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  get '/' do
    'Hello Chitter!'
  end

  run! if app_file == Chitter
end
