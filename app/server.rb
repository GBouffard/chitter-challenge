require 'sinatra'
require 'sinatra/partial'
require 'rack-flash'
require_relative 'data_mapper_setup'
require_relative 'helpers/session_helper'
require_relative 'controllers/users'
require_relative 'controllers/sessions'
require_relative 'controllers/peeps'
require_relative 'controllers/comments'

set :public_folder, proc { File.join(root, '..', 'public') }
enable :sessions
use Rack::Flash
use Rack::MethodOverride
helpers SessionHelper
set :partial_template_engine, :erb

get '/' do
  flash[:notice] = nil
  flash[:errors] = nil
  @peeps = Peep.all.reverse!
  erb :index
end
