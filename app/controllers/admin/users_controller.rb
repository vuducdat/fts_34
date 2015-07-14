class Admin::UsersController < Admin::BaseController
  load_and_authorize_resource find_by: :slug, only: [:destroy]

  def index
    @users = User.paginate page: params[:page]
  end

  def destroy
    @user.destroy
    flash[:notice] = t "delete_user"
    redirect_to admin_users_url
  end
end
