class SessionsController < ApplicationController
  #skip_before_action :verified_user, only: [:new, :create]
  def new
    @user = User.new
    render :login
  end

  def create

    if auth_hash = request.env["omniauth.auth"]
      #raise auth_hash.inspect
      oauth_email = request.env["omniauth.auth"]["info"]["email"]
      if oauth_email == nil
        oauth_email = "#{request.env["omniauth.auth"]["info"]["nickname"]}@gmail.com" 
      end
      oauth_name = request.env["omniauth.auth"]["info"]["nickname"]
      if user = User.find_by(:email => oauth_email)
        session[:user_id] = user.id
      else
        user = User.new(:name => oauth_name, :email => oauth_email, :password => SecureRandom.hex)
        if user.save
          session[:user_id] = user.id
          redirect_to root_path
        else
          raise user.errors.full_messages.inspect
        end
      end
      
    else
      @user = User.find_by(email: params[:user][:email])
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        #current_user = @user
        redirect_to user_path(@user)
      else
        flash[:error] = "Sorry, your username or password was incorrect"
        redirect_to '/login'
      end
    end


    
  end

  def fbcreate
    
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      #u.password = auth['uid']
      u.password = SecureRandom.hex
    end
    #user = Usersfb.from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = @user.id

    redirect_to redirect_to user_path(@user)
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