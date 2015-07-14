class Admin::ExamsController < ApplicationController
  load_and_authorize_resource
  before_action :check_admin_user

  def update
    @exam = Exam.find params[:id]
    if @exam.update_attributes exam_params
      flash[:success] = t :success_flash
      redirect_to admin_exam_path @exam
    else
      flash[:danger] = t :failed_flash
      render :edit
    end
  end

  private
  def exam_params
    params.require(:exam).permit :checked, results_attributes: [:correct, :id]
  end

  def check_admin_user
    redirect_to root_url if current_user.normal?
  end
end
