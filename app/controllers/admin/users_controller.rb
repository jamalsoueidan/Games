class Admin::UsersController < AdminController
  def index
    @users = User.paginate(:page => params[:page]).order('id DESC')
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    user = User.find(params[:id])
    user.update_attributes(params[:user])
    redirect_to admin_users_path, :notice => user.nickname + " is updated!"
  end
end
