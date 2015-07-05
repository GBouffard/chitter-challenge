get '/comments/:id/new' do
  @peep = Peep.get(params[:id])
  erb :'comments/new'
end

post '/comments/:id' do
  Comment.create(message: params[:message],
                 peep_id: params[:id],
                 user_id: session[:user_id],
                 date_time: DateTime.now)
  redirect '/'
end
