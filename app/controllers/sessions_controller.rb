class SessionsController < ApplicationController
  def new
  end
 
  def create
    password_hash = Digest::MD5.digest(params[:password_hash]).force_encoding("utf-8")
    if user = User.where({email: params[:username], password_hash: password_hash})
      session[:current_user_id] = user.user_id
      redirect_to posts_path
    else
      render 'new'
    end
  end
 
  def destroy
    # Remove the user id from the session
    @_current_user = session[:current_user_id] = nil
    redirect_to users_new
  end
  
end
