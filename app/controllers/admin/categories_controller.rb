class Admin::CategoriesController < Admin::BaseController
  before_action :set_category, only: [:show, :destroy]

  def new
    @category = Category.new
  end

  def index
    @categories = Category.paginate page: params[:page]
  end
  
  def show
  end

  def create
    @category = Category.new category_params
    if @category.save
      redirect_to admin_categories_url, success: t("update_success")
    else
      reder :new
    end
  end
  
  def destroy
    @category.destroy
    flash[:notice] = t "delete_category"
    redirect_to admin_categories_url
  end

  private
  def set_category
    @category = Category.find params[:id]
  end

  def category_params
    params.require(:category).permit :name, :exetime
  end
end
