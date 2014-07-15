class SessionsController < ApplicationController
  def new
  end
 
  def create
    @current_user = User.authenticate(user_params[:email], user_params[:password_hash])
    if @current_user 
      session[:current_user_id] = @current_user.id
      redirect_to posts_path
    else
      redirect_to signin_path
    end
  end
 
  def destroy
    @current_user = session[:current_user_id] = nil
    redirect_to signin_path
  end
  
  private
  def user_params
    params.require(:user).permit(:email, :password_hash)
  end
  
end
