class ApplicationController < ActionController::Base
  helper_method :current_user
  before_action :redirect_if_not_logged_in

  private

  def redirect_if_not_logged_in
    if !logged_in?
      redirect_to '/' 
    end
  end

  def logged_in?
    !!current_user
  end
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

end
