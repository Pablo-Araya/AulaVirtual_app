class Role < ApplicationRecord
	# Model associations
	has_many :user, foreign_key: :role_id

end
