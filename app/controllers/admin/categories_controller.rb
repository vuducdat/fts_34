class Admin::CategoriesController < Admin::BaseController
  before_action :set_category, except: [:new, :index, :create]

  def new
    @category = Category.new
  end

  def index
    @categories = Category.paginate page: params[:page]
  end
  
  def show
  end

  def edit
  end

  def create
    @category = Category.new category_params
    if @category.save
      redirect_to [:admin, @category], flash: {success: t("update_success")}
    else
      render :new
    end
  end
  
  def update
    if @category.update_attributes category_params
      redirect_to [:admin, @category], flash: {success: t("update_success")}
    else
      render :edit
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
