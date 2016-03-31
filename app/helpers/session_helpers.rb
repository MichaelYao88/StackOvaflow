def logged_in?
  session[:user_id]
end

def current_user
  if logged_in?
    @current_user = User.find(session[:user_id])
  end
end
