namespace :db do
	desc "Trunca y Crea Usuarios con Faker"
	task :Fake_users => :environment do
		require 'faker'
		
		User.destroy_all
		puts "Se han eliminado todos los registros de usuarios"
		
		#Create 15 users
		15.times do
			user = User.new
				user.nombre   = Faker::Name.first_name
				user.lastName = Faker::Name.last_name 
				user.gender   = Faker::Boolean.boolean(0.5)				
				user.email    = Faker::Internet.safe_email(user.nombre)
				user.role_id  = Faker::Number.between(1, 3)
				user.username = Faker::Internet.user_name(user.nombre)
				user.password = Faker::Internet.password(8)
			user.save!
		end

		puts "Se han creado #{User.count} nuevos usuarios"			
	end
end
