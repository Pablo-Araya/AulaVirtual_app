class Category < ApplicationRecord
	# Model associations
	has_many :catedra, foreign_key: :category_id

	# Validations
	validates :title, presence: true, length: { in: 2..100 }, uniqueness: true

end