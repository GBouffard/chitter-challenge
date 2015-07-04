get '/peeps/new' do
  erb :'peep/new'
end

post '/peeps' do
  Peep.create(message: params[:message], user_id: session[:user_id])

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
