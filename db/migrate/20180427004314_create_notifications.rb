class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.belongs_to :clase, null: false
      t.string :title, null: false
      t.text :description, null: false
      t.string :adjunto, null: true
      t.timestamps
    end
  end
end
