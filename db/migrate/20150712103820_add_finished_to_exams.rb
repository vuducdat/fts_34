class AddFinishedToExams < ActiveRecord::Migration
  def change
    add_column :exams, :finished, :datetime
  end
end
