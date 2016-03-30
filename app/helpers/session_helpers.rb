def logged_in?
  return true if session[:user_id]
end

def current_user
  @current_user = User.find_by(id: session[:user_id])
end
