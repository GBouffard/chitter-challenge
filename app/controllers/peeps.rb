get '/peeps/new' do
  erb :'peeps/new'
end

post '/peeps' do
  peep_message = params[:message]
  if peep_message.empty?
    flash[:notice] = 'You cannot post an empty peep!'
    redirect '/peeps/new'
  elsif peep_message.length > 140
    flash[:notice] = 'Peeps are limited to 140 characters!'
    redirect '/peeps/new'
  else
    Peep.create(message: params[:message],
                user_id: session[:user_id],
                date_time: DateTime.now)
    redirect '/'
  end
end

delete '/peeps/:id' do
  @peep = Peep.get(params[:id])
  @peep.destroy
  flash[:success] = 'Peep successfully deleted!'
  redirect to('/')
end

get '/peeps/:id' do
  @peep = Peep.get(params[:id])
  erb :'peeps/show'
end

put '/peeps/:id' do
  @peep = Peep.get(params[:id])
  peep_message = params[:message]
  if peep_message.empty?
    flash[:notice] = 'You cannot update to an empty peep!'
    erb :'peeps/show'
  elsif peep_message.length > 140
    flash[:notice] = 'Peeps are limited to 140 characters!'
    erb :'peeps/show'
  else
    @peep.update(message: params[:message])
    flash[:notice] = nil
    flash[:success] = 'Peep successfully updated!'
    redirect to('/')
  end
end

get '/peep_page/:id' do
  @peep = Peep.get(params[:id])
  @comments = Comment.all.select { |comment| @peep.id == comment.peep_id }
  erb :'peeps/page'
end
