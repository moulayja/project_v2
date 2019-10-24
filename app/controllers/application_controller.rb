class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorize
    redirect_to '/login' if current_user.nil?
  end

  def log_in(user)
    session[:user_id] = user.id
  end

helper_method :current_user
helper_method :authorize
helper_method :log_in

end
