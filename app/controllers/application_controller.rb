class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :logged_in?
  #helper_method :user_is_authenticated

  private

  def redirect_if_not_logged_in
    redirect_to '/' if verified_user
  end

  def logged_in?
    !!current_user
  end
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

end
