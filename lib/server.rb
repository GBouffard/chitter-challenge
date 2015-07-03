require 'sinatra/base'
require_relative 'data_mapper_setup'
require_relative 'helpers/session_helper'

class Chitter < Sinatra::Base
  enable :sessions
  set :views, proc { File.join(root, '..', 'views') }
  use Rack::MethodOverride
  helpers SessionHelper

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(email: params[:email],
                       password: params[:password])
    session[:user_id] = user.id
    redirect '/'
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
