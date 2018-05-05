class CreateCatedraSurveys < ActiveRecord::Migration[5.0]
  def change
    create_table :catedra_surveys do |t|
      t.integer :catedra_id, null: false
      t.integer :student_id, null: false
      t.integer :key, null: false
      t.timestamps
    end
  end
end
