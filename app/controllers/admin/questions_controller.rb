class Admin::QuestionsController < Admin::BaseController
  before_action :set_category, only: [:new, :create]

  def new
    @question = @category.questions.build
    Settings.question.answers.minimum.times{@question.answers.build}
  end

  def create
    @question = @category.questions.new question_params
    if @question.save
      redirect_to [:admin, @category], flash: {success: t("update_success")}
    else
      render :new
    end
  end

  private
  def set_category
    @category = Category.find params[:category_id]
  end

  def question_params
    params.require(:question).permit :content,
      answers_attributes: [:id, :content, :is_correct, :_destroy]
  end
end
