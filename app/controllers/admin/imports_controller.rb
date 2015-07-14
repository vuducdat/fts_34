class Admin::ImportsController < Admin::BaseController
  def create
    Category.import params[:file]
    redirect_to admin_categories_path, flash: {success: t("update_success")}
  end
end
