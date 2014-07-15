class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :authenticate
  
  protected
  def authenticate
    unless (session[:current_user_id])
      if (params[:controller] != "sessions" && params[:controller] != "users")
        redirect_to signin_path
      end
    end
  end
  
end
