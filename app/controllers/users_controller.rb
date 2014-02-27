class UsersController < ApplicationController
  def new
    reset_session
    @user = User.new
  end
  def create
    
  end
end
