class UsersController < ApplicationController
  
  #loading signup form
  def new
    @user = User.new
  end

  #sign up the user
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to :show
    else
      render :new
    end
  end

  def show
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
