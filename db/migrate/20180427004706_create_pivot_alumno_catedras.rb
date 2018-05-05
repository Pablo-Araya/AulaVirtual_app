class CreatePivotAlumnoCatedras < ActiveRecord::Migration[5.0]
  def change
    create_table :pivot_alumno_catedras do |t|
      t.integer :student_id, null: false
      t.integer :catedra_id, null: false
      t.timestamps
    end
  end
end
