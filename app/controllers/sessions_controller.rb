class SessionsController < ApplicationController
  #skip_before_action :verified_user, only: [:new, :create]
  def new
    @user = User.new
    render :login
  end

  def create
    #raise auth_hash.inspect
    # if auth_hash = request.env["omniauth.auth"]
    #   #raise auth_hash.inspect
    #   oauth_email = auth_hash["info"]["email"]
    #   if oauth_email == nil
    #     oauth_email = "#{auth_hash["info"]["nickname"]}@gmail.com" 
    #   end
    #   oauth_name = auth_hash["info"]["nickname"]
    #   if user = User.find_by(:email => oauth_email)
    #     session[:user_id] = user.id
    #   else
    #     user = User.new(:name => oauth_name, :email => oauth_email, :password => 1234)
    #     if user.save
    #       session[:user_id] = user.id
    #       redirect_to root_path
    #     else
    #       raise user.errors.full_messages.inspect
    #     end
    #   end
    # else
      user = User.find_by(email: params[:user][:email])
      if user && user.authenticate(params[:user][:password])
        session[:user_id] = user.id
        #current_user = user
        redirect_to user_path(user)
      else
        flash[:error] = "Sorry, your username or password was incorrect"
        redirect_to '/login'
      end
    #end

  end

  def home
  end

  def destroy
    session.clear
    #current_user = nil
    redirect_to '/'
  end

  private

  def auth
    request.env['omniauth.auth']
  end
  
end