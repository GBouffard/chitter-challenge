require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  set :views, proc { File.join(root, '..', 'views') }
  use Rack::MethodOverride

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  get '/peeps/new' do
    erb :'peep/new'
  end

  post '/peeps' do
    Peep.create(message: params[:message])
    redirect to('/')
  end

  delete '/peeps/:id' do
    @peep = Peep.get(params[:id])
    @peep.destroy
    redirect to('/')
  end

  get '/peeps/:id' do
    @peep = Peep.get(params[:id])
    erb :'peep/show'
  end

  put '/peeps/:id' do
    @peep = Peep.get(params[:id])
    @peep.update(message: params[:message])
    redirect to('/')
  end

  run! if app_file == Chitter
end
