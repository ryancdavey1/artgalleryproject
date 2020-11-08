class UsersController < ApplicationController
  skip_before_action :redirect_if_not_logged_in, only:[:new, :create]

  #loading signup form
  def new
    @user = User.new
  end

  #sign up the user
  def create
    @user = User.new(user_params)
    
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    if @user.id != current_user.id
      redirect_to user_path(current_user)
    end
  end


  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
