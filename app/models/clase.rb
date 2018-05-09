class Clase < ApplicationRecord
	# Model associations
	has_many :notification, foreign_key: :clase_id
	belongs_to :catedra

	# Validations
	validates :catedra_id, presence: true, numericality: { only_integer: true }
	validates :title, presence: true, length: { in: 2..100 }

end
