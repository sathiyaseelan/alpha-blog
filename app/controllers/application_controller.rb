class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  # To get the current user
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  # To check whether the user is logged in
  def logged_in?
    !!current_user
  end

  # Method to ensure redirection to home page to avoid unauthorized access
  def require_user
    unless logged_in?
      flash[:danger] = "You must be logged in"
      redirect_to root_path
    end
  end
end
