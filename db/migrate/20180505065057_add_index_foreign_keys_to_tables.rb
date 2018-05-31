class AddIndexForeignKeysToTables < ActiveRecord::Migration[5.0]
  def change
  	add_foreign_key :users, :roles
  	add_foreign_key :teachers, :users
  	add_foreign_key :students, :users
  	add_foreign_key :clases, :catedras
  	add_foreign_key :notifications, :clases
  	add_foreign_key :catedra_surveys, :catedras
  	add_foreign_key :catedra_surveys, :students
  	add_foreign_key :pivot_alumnos_catedras, :students
  	add_foreign_key :pivot_alumnos_catedras, :catedras
  	add_foreign_key :catedras, :categories
    add_foreign_key :catedras, :teachers
  	add_foreign_key :user_tokens, :users

  end
end
