class SessionsController < ApplicationController
  #skip_before_action :verified_user, only: [:new, :create]
  def new
    @user = User.new
    render :login
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      #current_user = @user
      redirect_to user_path(@user)
    else
      #flash[:danger] = 'Invalid email/password combination'
      redirect_to '/login'
    end
  end

  def home
  end

  def destroy
    session.clear
    #current_user = nil
    redirect_to '/'
  end

  
end