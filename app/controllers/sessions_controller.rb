class SessionsController < ApplicationController
  def new
  end
 
  def create
    @current_user = User.authenticate(user_params[:email], user_params[:password_hash])
    if @current_user 
      session[:current_user_id] = @current_user.id
      session[:current_user_email] = @current_user.email
      flash[:notice] = 'Welcome.'
      redirect_to posts_path
    else
      flash[:error] = 'Unknown user. Please check your username and password.'
      redirect_to signin_path
    end
  end
 
  def destroy
    @current_user = session[:current_user_id] = session[:current_user_email] = nil
    redirect_to signin_path
  end
  
  private
  def user_params
    params.require(:user).permit(:email, :password_hash)
  end
  
end
