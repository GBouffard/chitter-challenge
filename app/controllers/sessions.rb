get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions' do
  username = params[:username]
  password = params[:password]
  user = User.authenticate(username, password)
  if user
    session[:user_id] = user.id
    redirect to('/')
  else
    flash[:errors] = ['The username or password is incorrect']
    erb :'sessions/new'
  end
end

delete '/sessions' do
  flash[:success] = 'Good bye!'
  session[:user_id] = nil
  redirect to '/'
end
