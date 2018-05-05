class CreatePivotAlumnosCatedras < ActiveRecord::Migration[5.0]
  def change
    create_table :pivot_alumnos_catedras do |t|
      t.belongs_to :student, null: false
      t.belongs_to :catedra, null: false
      t.timestamps
    end
  end
end
