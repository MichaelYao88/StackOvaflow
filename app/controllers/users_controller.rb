get '/users/new' do
  erb :'/users/new'
end

post '/users' do
  user=User.new(username: params[:username], password: params[:password], email: params[:email])
  if user.save
    session[:user_id] = user.id
    redirect "/"
  else
    @errors = user.errors.full_messages[0]

    erb :"/users/new"
  end
end