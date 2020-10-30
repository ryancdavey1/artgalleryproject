class ApplicationController < ActionController::Base
  #before_action :verified_user
  helper_method :current_user, :verified_user, :user_is_authenticated

  private
  def verified_user
    redirect_to 'sessions#home' if !user_is_authenticated
  end

  def user_is_authenticated
    !!current_user
  end
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  
end
