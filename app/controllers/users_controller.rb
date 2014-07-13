class UsersController < ApplicationController

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    # Encrypta la password.
    @user.password_hash = Digest::MD5.digest(user_params[:password_hash]).force_encoding("utf-8") 
    @user.save
    redirect_to users_path
    
  end
  
  
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = user.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:email, :password_hash)
  end 
  
end
