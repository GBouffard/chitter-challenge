require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  set :views, proc { File.join(root, '..', 'views') }

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  get '/peeps/new' do
    erb :'peep/new'
  end

  run! if app_file == Chitter
end
