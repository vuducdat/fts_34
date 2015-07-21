class StaticPagesController < ApplicationController
  def home
    redirect_to exams_path if user_signed_in?
  end

  def help
  end

  def contact
  end

  def about
  end
end
