class User < ApplicationRecord
	# encrypt password
	# has_secure_password

	# Model associations
	has_many :teacher, foreign_key: :user_id
	has_many :student, foreign_key: :user_id
	belongs_to :role
	
	# Validations
	validates :nombre, presence: true, length: { in: 2..100 }
	validates :lastName, presence: true, length: { in: 2..100 }
	validates :gender, inclusion: { in: [ true, false ] }
	validates :email, presence: true, email: true, uniqueness: true
	validates :role_id, presence: true, length: { is: 1 }, numericality: { only_integer: true }, inclusion: { in: 1..3 }
	validates :username, presence: true, length: { in: 2..15 }, uniqueness: true
	validates :password, presence: true, length: { in: 8..10 }
		
end
