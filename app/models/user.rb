require 'bcrypt'

class User < ApplicationRecord
	include BCrypt

	belongs_to :role
	
	def password
		@password ||= Password.new(password_hash)
	end

	def password=(new_password)
		@password = Password.create(new_password)
		self.password_hash = @password
	end
	
end
