class CreateCatedras < ActiveRecord::Migration[5.0]
  def change
    create_table :catedras do |t|
      t.integer :category_id, null: false
      t.integer :teacher_id, null: false
      t.string :title, null: false
      t.text :description
      t.timestamps
    end
  end
end
