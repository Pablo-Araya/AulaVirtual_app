class CreateCatedras < ActiveRecord::Migration[5.0]
  def change
    create_table :catedras do |t|
      t.belongs_to :category, null: false
      t.belongs_to :teacher, null: false
      t.string :title, null: false
      t.text :description
      t.timestamps
    end
  end
end
