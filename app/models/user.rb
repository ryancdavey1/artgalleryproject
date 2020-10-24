class User < ApplicationRecord
  has_secure_password

  #loading signup form
  def new
  end

  #sign up the user
  def create
  end
end
