class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.integer :user_id
      t.integer :categories_id
      t.boolean :done, default: false
      t.references :user, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true
      t.integer :correct_number

      t.timestamps null: false
    end
  end
end
