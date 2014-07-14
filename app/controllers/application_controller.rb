class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :authenticate
  
  protected
  def authenticate
    @_current_user ||= session[:current_user_id] &&
    User.find_by(id: session[:current_user_id])
  end
  
end
