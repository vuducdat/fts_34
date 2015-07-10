class ExamsController < ApplicationController
  load_and_authorize_resource

  def index
    @exams = current_user.exams.order_by_created_at.paginate page: params[:page],
                                                             per_page: Settings.exam_page_size
    @exam = Exam.new
    @categories = Category.all
  end

  def show
    @exam = Exam.find params[:id]
  end

  def create
    @exam.user = current_user
    @exam.save ? flash[:success] = t(:success) : flash.now[:danger] = t(:fail)
    redirect_to exams_path
  end

  def edit
    @exam = Exam.find params[:id]
    if @exam.done?
      flash[:success] = t :done_flash
      redirect_to @exam
    end
  end

  def update
    if @exam.update_attributes exam_params
      flash[:success] = t(:update_success)
      redirect_to @exam
    else
      flash.now[:danger] = t(:update_fail)
      redirect_to :back
    end
  end

  private
  def exam_params
    params.require(:exam).permit :category_id, :done,
      results_attributes: [:id, :answer_id]
  end
end
