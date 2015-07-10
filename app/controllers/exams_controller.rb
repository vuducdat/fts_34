class ExamsController < ApplicationController
  load_and_authorize_resource

  def index
    @exams = current_user.exams.order_by_created_at.paginate page: params[:page],
                                                             per_page: Settings.exam_page_size
    @exam = Exam.new
  end

  def create
    @exam.user = current_user
    if @exam.save
      flash[:success] = t :success
    else
      flash.now[:danger] = t :fail
    end
    redirect_to exams_path
  end

  private
  def exam_params
    params.require(:exam).permit :category_id, :done,
      results_attributes: [:id, :answer_id]
  end
end
