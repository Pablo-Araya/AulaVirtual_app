class AddIndexToTableRoles < ActiveRecord::Migration[5.0]
  def change
    change_table :roles do |t|
      t.index :key, unique: true
    end
  end
end
