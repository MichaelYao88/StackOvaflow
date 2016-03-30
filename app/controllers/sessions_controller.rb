get '/' do
  erb :index
end

get '/session/new' do
  erb :'/session/new'
end

post '/session' do
  user = User.authenticate(params[:name], params[:password])
  if user
    session[:user_id] = user.id
    redirect "/"
  else
    @errors = ["Incorrect Name / Password combination."]
    erb :'/session/new'
  end
end

get '/logout' do
  session.delete(:user_id)
  redirect '/'
end

get '/not_authorized' do
  erb :not_authorized
end
