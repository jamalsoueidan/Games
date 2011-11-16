class UsersController < ApplicationController
  def new
    @user = User.new_omniauth(session[:auth])
  end
  
  def create
    @user = User.new_omniauth(session[:auth])
    @user.update_attributes(params[:user])
    @user.save!
  
    session[:auth] = nil
    session[:user_id] = @user.id
    
    @user.update_session!
    redirect_to games_path, :notice => "Signed in!"
    
    rescue ActiveRecord::RecordInvalid
      render :action => 'new'
  end
end
