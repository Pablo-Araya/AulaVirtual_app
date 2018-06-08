namespace :db do
	desc "Trunca y Crea Usuarios con Faker"

	task :Fake_users => :environment do
		require 'faker'
		
		Teacher.destroy_all
		Student.destroy_all
		User.destroy_all
		Catedra.destroy_all
		puts "Se han eliminado todos los usuarios"	

		#Create 2 usersAdmin
		user = User.new
			user.nombre   = 'Pablo'
			user.lastName = 'Sánchez' 
			user.gender   = 0				
			user.email    = 'psanchez@gmail.com'
			user.role_id  = 1
			user.username = 'Pablo-Sanchez'
			user.password = 12345678
		user.save!

		user = User.new
			user.nombre   = 'Pablo'
			user.lastName = 'Araya del Pino' 
			user.gender   = 0				
			user.email    = 'p.arayadelpino@gmail.com'
			user.role_id  = 1
			user.username = 'Pablo-Araya'
			user.password = 12345678
		user.save!

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

		#Create 3 Catedras básicas
		catedra = Catedra.new
			catedra.category_id = 1
			catedra.teacher_id 	= 1
			catedra.title 		= 'PHP desde cero'
			catedra.description = 'Aprende PHP desde sus inicios, en tan solo 3 semanas podrás entender las bases del lenguaje y crear tu propia WebApp'
			catedra.img 		= 'http://www.morphosys.cl/aulaVirtual/uploads/1-PHP.jpg'
		catedra.save!

		catedra = Catedra.new
			catedra.category_id = 1
			catedra.teacher_id 	= 2
			catedra.title 		= 'Ruby on Rails Web API'
			catedra.description = 'Ruby on rails desde sus inicios hasta lograr crear tu propia web API'
			catedra.img 		= 'http://www.morphosys.cl/aulaVirtual/uploads/2-rubyOnRails.jpg'
		catedra.save!

		catedra = Catedra.new
			catedra.category_id = 1
			catedra.teacher_id 	= 2
			catedra.title 		= 'AngularJS de Principiante a Experto'
			catedra.description = 'Conviértete en programador de FrontEnd estudiando desde tu casa al tiempo que tu puedas!'
			catedra.img 		= 'http://www.morphosys.cl/aulaVirtual/uploads/2-angular.jpg'
		catedra.save!

		puts "Se han creado #{Catedra.count} nuevas cátedras"

	end

end
