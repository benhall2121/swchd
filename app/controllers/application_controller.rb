class ApplicationController < ActionController::Base
  before_filter :require_login
  protect_from_forgery
  
  helper_method :current_user

  private

  def require_login
    unless current_user
      redirect_to root_path
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def require_admin
    unless is_admin?
      redirect_to root_path	  
    end
  end
  
  def is_admin?
    if current_user
      return current_user.admin?
    else
      return false
    end	  
  end
end
