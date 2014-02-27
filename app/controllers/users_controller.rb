class UsersController < ApplicationController
  def new
    reset_session
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.user_id
      redirect_to root_path, notice: 'You have signed up'
    else
      
    end
  end

  private
  def user_params
    @user = User.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
