class AddIsCorrectToResults < ActiveRecord::Migration
  def change
    add_column :results, :correct, :boolean, null: true, default: false
  end
end
