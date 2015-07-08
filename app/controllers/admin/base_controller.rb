class Admin::BaseController < ApplicationController
  before_action :verify_admin, only: [:index]

  private
  def verify_admin
    unless current_user.admin?
      flash[:danger] = t "not_admin"
      redirect_to root_url
    end   
  end
end
