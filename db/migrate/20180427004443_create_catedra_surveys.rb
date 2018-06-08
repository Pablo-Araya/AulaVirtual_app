class CreateCatedraSurveys < ActiveRecord::Migration[5.0]
  def change
    create_table :catedra_surveys do |t|
      t.belongs_to :catedra, null: false
      t.belongs_to :student, null: false
      t.decimal :key, precision: 2, scale: 1, null: false
      t.timestamps
    end
  end
end
