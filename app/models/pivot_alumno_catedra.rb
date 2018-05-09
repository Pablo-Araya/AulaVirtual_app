class PivotAlumnoCatedra < ApplicationRecord
	# Model associations
	self.table_name = "pivot_alumnos_catedras"
	belongs_to :student
	belongs_to :catedra

	# Validations
	validates :student_id, presence: true, numericality: { only_integer: true }
	validates :catedra_id, presence: true, numericality: { only_integer: true }

end
