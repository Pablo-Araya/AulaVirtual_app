class CreateClases < ActiveRecord::Migration[5.0]
  def change
    create_table :clases do |t|
      t.integer :catedra_id, null: false
      t.string :title, null: false
      t.text :description
      t.timestamps
    end
  end
end
