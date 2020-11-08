class SessionsController < ApplicationController
  skip_before_action :redirect_if_not_logged_in, only: [:new, :create, :home, :github]

  def new
    @user = User.new
    render :login
  end

  def create
      user = User.find_by(email: params[:user][:email])
      if user && user.authenticate(params[:user][:password])
        session[:user_id] = user.id
        redirect_to user_path(user)
      else
        flash[:error] = "Sorry, your username or password was incorrect"
        redirect_to '/login'
      end
  end

  def home
  end

  def destroy
    session.clear
    redirect_to '/'
  end

  def github
    #raise auth.inspect
    oauth_email = auth["info"]["email"]
    if oauth_email == nil
      oauth_email = "#{auth["info"]["nickname"]}@gmail.com" 
    end
    oauth_name = auth["info"]["nickname"]
    @user = User.find_or_create_by(email: oauth_email)
    if @user
      @user.name = auth["info"]["name"]
      @user.password = SecureRandom.hex() 
    end  
    if @user.persisted?
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to '/'
    end
  end

  private

  def auth
    request.env['omniauth.auth']
  end

end