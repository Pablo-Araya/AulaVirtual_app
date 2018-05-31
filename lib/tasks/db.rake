namespace :db do
	desc "Trunca y Crea Usuarios con Faker"

	task :Fake_users => :environment do
		require 'faker'
		
		Teacher.destroy_all
		Student.destroy_all
		User.destroy_all
		puts "Se han eliminado todos los usuarios"	

		#Create 1 usersAdmin
		1.times do
			user = User.new
				user.nombre   = Faker::Name.first_name
				user.lastName = Faker::Name.last_name 
				user.gender   = Faker::Boolean.boolean(0.5)				
				user.email    = Faker::Internet.safe_email(user.nombre)
				user.role_id  = 1
				user.username = 'admin'
				user.password = 1234
			user.save!
		end

		#Create 5 usersTeacher
		5.times do
			user = User.new
				user.nombre   = Faker::Name.first_name
				user.lastName = Faker::Name.last_name 
				user.gender   = Faker::Boolean.boolean(0.5)				
				user.email    = Faker::Internet.safe_email(user.nombre)
				user.role_id  = 2
				user.username = Faker::Internet.user_name(user.nombre)
				user.password = Faker::Internet.password(8, 10, true, true)
			user.save!

			i = User.where(:role_id => user.role_id).last
			teacher = Teacher.new
				teacher.user_id = i.id
			teacher.save!
		end

		#Create 15 usersStudent
		15.times do
			user = User.new
				user.nombre   = Faker::Name.first_name
				user.lastName = Faker::Name.last_name 
				user.gender   = Faker::Boolean.boolean(0.5)				
				user.email    = Faker::Internet.safe_email(user.nombre)
				user.role_id  = 3
				user.username = Faker::Internet.user_name(user.nombre)
				user.password = Faker::Internet.password(8, 10, true, true)
			user.save!

			i = User.where(:role_id => user.role_id).last
			student = Student.new
				student.user_id = i.id
			student.save!
		end

		puts "Se han creado #{User.count} nuevos usuarios"	
	end

end
