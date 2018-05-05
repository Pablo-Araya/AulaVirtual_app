namespace :db do
	desc "Trunca y Crea Usuarios con Faker"
	task :Fake_users => :environment do
		
		User.destroy_all
		
		#Create 15 users
		15.times do
			User.create do |u|
				u.nombre   = Faker::Name.first_name
				u.lastName = Faker::Name.last_name 
				u.gender   = FactoryHelper::String.random(['m', 'f'])			
				u.email    = Faker::Internet.safe_email(u.nombre)
				u.role_id  = Faker::Number.between(1, 3)
				u.username = Faker::Internet.user_name(u.nombre)
				u.password = Faker::Internet.password(8)
			end
		end

		puts "Se han creado #{User.count} nuevos usuarios"			
	end
end
