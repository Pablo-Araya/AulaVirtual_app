class Catedra < ApplicationRecord
	# Model associations
	has_many :clase, foreign_key: :catedra_id, dependent: :destroy
	has_many :catedra_survey, foreign_key: :catedra_id, dependent: :destroy
	has_many :student, :through => :pivot_alumno_catedra
	belongs_to :teacher
	belongs_to :category

	# Validations
	validates :category_id, presence: true, numericality: { only_integer: true }
	validates :teacher_id, presence: true, numericality: { only_integer: true }
	validates :title, presence: true, length: { in: 2..100 }
		
end
