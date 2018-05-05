require 'faker'

namespace :user do
	desc "Trunca y Crea Usuarios con Faker"
	task :fake_users => :environment do
		
		User.destroy_all
		
		#Create 15 users
		15.times do
			User.create do
				u.nombre   = Faker::Name.first_name
				u.lastName = Faker::Name.last_name 
				gender     = Faker::Boolean(0.4)
				if gender == true
					u.gender = 'm'
				else
					u.gender = 'f'
				end			
				u.email    = Faker::Internet.safe_email(u.nombre)
				u.role_id  = Faker::Number.between(1, 3)
				u.username = Faker::Internet.user_name(u.nombre)
				u.password = Faker::Internet.password(8)
			end
		end

		puts "Se han creado #{User.count} nuevos usuarios"			
	end
end
