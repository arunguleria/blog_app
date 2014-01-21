class UsersController < ApplicationController
  
  before_action :check_no_login, only: [:signup, :signin]
  
  private
  
  def check_no_login
    if current_user
      redirect_to authors_path, alert: "You are already logged in."
    end
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  public
  
  def signup
    if request.get?
      @user = User.new
    elsif request.post?
      @user = User.new(user_params)
      if @user.save
        redirect_to signin_url, notice: "Your account has been created. Please login to continue.."
      else
        flash[:alert] = "Please provide correct information and try again!"
      end
    end
  end

  def signin
    if request.post?
      @user = User.authenticate(user_params)
      if @user.is_a?(User)
        session[:current_user] = @user
        redirect_to authors_path, notice: "You have successfullys signed in."
      else
        flash[:alert] = "Sorry, invalid email or password. Please try again!"
      end
    end
  end
  
  
  def logout
    reset_session
    redirect_to signin_url, notice: "You have been logged out successfully."
  end
  
end



