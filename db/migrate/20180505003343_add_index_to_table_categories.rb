class AddIndexToTableCategories < ActiveRecord::Migration[5.0]
  def change
    change_table :categories do |t|
      t.index :title, unique: true
    end
  end
end
