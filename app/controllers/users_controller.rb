get '/users/new' do
  erb :'/users/new'
end

post '/users' do
  user = User.new(params[:user])
  if user.save
    session[:user_id] = user.id
    redirect "/users/show"
  else
    @errors = user.errors.full_messages
    erb :"/users/new"
  end
end

get '/users/show' do
  @user= current_user
  @questions= @user.questions
  @answers= @user.answers
  erb :'/users/show'

end
