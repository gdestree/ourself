module UsersHelper
  def logged_in?
    session[:user_id] && current_user
  end

  def current_user
    User.find_by(id: session[:user_id])
  end
end
