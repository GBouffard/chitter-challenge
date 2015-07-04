get '/peeps/new' do
  erb :'peep/new'
end

post '/peeps' do
  peep_message = params[:message]
  if peep_message.empty?
    flash[:notice] = 'You cannot post an empty peep!'
    redirect '/peeps/new'
  else
    @peep = Peep.create(message: params[:message], 
                        user_id: session[:user_id],
                        date_time: DateTime.now)
    redirect '/'
  end
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
  peep_message = params[:message]
  if peep_message.empty?
    flash[:notice] = 'You cannot update to an empty peep!'
    erb :'peep/show'
  else
    @peep.update(message: params[:message], )
    redirect to('/')
  end
end
