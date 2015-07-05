get '/comments/:id/new' do
  @peep = Peep.get(params[:id])
  erb :'comments/new'
end

post '/comments/:id' do
  comment_message = params[:message]
  if comment_message.empty?
    flash[:notice] = 'You cannot post an empty comment!'
    redirect "/comments/#{params[:id]}/new"
  else
    Comment.create(message: params[:message],
                   peep_id: params[:id],
                   user_id: session[:user_id],
                   date_time: DateTime.now)
    redirect '/'
  end
end
