class CreateCatedraSurveys < ActiveRecord::Migration[5.0]
  def change
    create_table :catedra_surveys do |t|
      t.belongs_to :catedra, null: false
      t.belongs_to :student, null: false
      t.integer :key, null: false
      t.timestamps
    end
  end
end
