class AddCheckedToExams < ActiveRecord::Migration
  def change
    add_column :exams, :checked, :boolean, default: false
  end
end
