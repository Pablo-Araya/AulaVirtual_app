class Student < ApplicationRecord
	# Model associations
	has_many :catedra_survey, foreign_key: :student_id, dependent: :destroy
	has_many :catedra, :through => :pivot_alumno_catedra
	belongs_to :user

end
