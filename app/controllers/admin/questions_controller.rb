class Admin::QuestionsController < Admin::BaseController
  load_and_authorize_resource :category
  load_and_authorize_resource through: :category

  def new
    @question = @category.questions.build
    2.times{@question.answers.build}
  end

  def create
    @question = @category.questions.new question_params
    if @question.save
      redirect_to [:admin, @category], flash: {success: t("update_success")}
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @question.update_attributes question_params
      redirect_to [:admin, @category], flash: {success: t("update_success")}
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to [:admin, @category], flash: {success: t("delete_question")}
  end

  private
  def question_params
    params.require(:question).permit :content,
      answers_attributes: [:id, :content, :is_correct, :_destroy]
  end
end
