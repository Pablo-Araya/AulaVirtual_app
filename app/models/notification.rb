class Notification < ApplicationRecord
	# Model associations
	belongs_to :clase

	# Validations
	validates :clase_id, presence: true, numericality: { only_integer: true }
	validates :title, presence: true, length: { in: 2..100 }

end
