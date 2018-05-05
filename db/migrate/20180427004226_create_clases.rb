class CreateClases < ActiveRecord::Migration[5.0]
  def change
    create_table :clases do |t|
      t.belongs_to :catedra, null: false
      t.string :title, null: false
      t.text :description
      t.timestamps
    end
  end
end
