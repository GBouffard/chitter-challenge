get '/comments/:id/new' do
  @peep = Peep.get(params[:id])
  erb :'comments/new'
end

post '/comments/:id' do
  comment_message = params[:message]
  if comment_message.empty?
    flash[:notice] = 'You cannot post an empty comment!'
    redirect "/comments/#{params[:id]}/new"
  elsif comment_message.length > 140
    flash[:notice] = 'Comments are limited to 140 characters!'
    redirect "/comments/#{params[:id]}/new"
  else
    Comment.create(message: params[:message],
                   peep_id: params[:id],
                   user_id: session[:user_id],
                   date_time: DateTime.now)
    redirect to("/peep_page/#{params[:id]}")
  end
end

delete '/comments/:id' do
  @comment = Comment.get(params[:id])
  @peep = @comment.peep_id
  @comment.destroy
  flash[:notice] = 'comments successfully deleted!'
  redirect to("/peep_page/#{@peep}")
end
