class Teacher < ApplicationRecord
	# Model associations
	has_many :catedra, foreign_key: :teacher_id, dependent: :destroy
	belongs_to :user

end
