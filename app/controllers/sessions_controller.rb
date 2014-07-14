class SessionsController < ApplicationController
  def new
  end
 
  def create
    user = User.authenticate(params[:email], params[:password_hash])
    if user 
      session[:current_user_id] = user.id
      redirect_to posts_path
    else
      render :action => "sign_in"
    end
  end
 
  def destroy
    # Remove the user id from the session
    @_current_user = session[:current_user_id] = nil
    redirect_to users_new
  end
  
end
