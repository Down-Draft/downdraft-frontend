class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :authorized

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorized
    redirect_to root_path, notice: 'You need to be logged in to access that page' unless current_user
  end
end
