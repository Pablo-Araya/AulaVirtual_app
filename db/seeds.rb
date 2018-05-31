# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Role.destroy_all
puts "Se borraron los datos de la tabla roles"
Role.create!([{
		key: 'admin'
	},
	{
		key: 'teacher'
	},
	{
		key: 'student'
	}
])
puts "Se han creado los #{Role.count} roles de usuarios"

Category.destroy_all
puts "Se borraron los datos de la tabla Categories"
Category.create!([{
		title: 'Desarrollo',
		icon: 'far fa-file-code',
		description: 'Cursos orientados a Programación'
	},
	{
		title: 'Negocios',
		icon: 'far fa-chart-bar',
		description: 'Finanzas, Economía, Metodologías'
	},
	{
		title: 'Desarrollo Personal',
		icon: 'fas fa-book',
		description: 'Liderazgo, Emprendimiento'
	},
	{
		title: 'Productividad en la Oficina',
		icon: 'far fa-clipboard',
		description: 'Herramientas para optimizar productividad en espacios de trabajo'
	}
])
puts "Se han creado las #{Category.count} categorías base del proyecto"