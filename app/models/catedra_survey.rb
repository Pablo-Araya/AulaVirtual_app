class CatedraSurvey < ApplicationRecord
	# Model associations
	belongs_to :catedra
	belongs_to :student

	# Validations
	validates :catedra_id, presence: true, numericality: { only_integer: true }
	validates :student_id, presence: true, numericality: { only_integer: true }
	validates :key, presence: true, length: { is: 1 }, numericality: { only_integer: true }, inclusion: { in: 1..5 }

end