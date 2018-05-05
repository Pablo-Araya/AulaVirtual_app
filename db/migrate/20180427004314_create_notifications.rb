class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.integer :clase_id, null: false
      t.string :title, null: false
      t.text :description, null: false
      t.timestamps
    end
  end
end
