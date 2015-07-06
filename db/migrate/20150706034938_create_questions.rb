class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :categories_id
      t.string :content
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
