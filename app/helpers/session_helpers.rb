def logged_in?
  return true if session[:user_id]
end

def current_user
  session[:user_id]
end