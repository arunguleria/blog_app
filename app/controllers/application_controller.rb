class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  
  helper_method :current_user
  def current_user
    session[:current_user]
  end
  
  def access_denied
    flash[:error] = "Sorry, you are not authorized to visit the requested page."
    redirect_to root_url
    return
  end
  
  private
  
  def check_login
    unless current_user
      redirect_to signin_url, alert: "Please login to continue"
    end
  end
  
  
  
end
