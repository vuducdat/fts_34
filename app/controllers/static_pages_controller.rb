class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
      redirect_to exams_path
    end
  end

  def help
  end

  def contact
  end

  def about
  end
end
