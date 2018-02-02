module ApplicationHelper

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_cart
    if current_user
      current_user.current_cart
    end
  end
end
