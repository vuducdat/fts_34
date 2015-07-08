class Admin::UsersController < Admin::BaseController
  before_action :set_user, only: [:destroy]
  
  def index
    @users = User.paginate page: params[:page]
  end

  def destroy
    @user.destroy
    flash[:notice] = t "delete_user"
    redirect_to admin_users_url
  end

  private
  def set_user
    @user = User.find params[:id]
  end
end
