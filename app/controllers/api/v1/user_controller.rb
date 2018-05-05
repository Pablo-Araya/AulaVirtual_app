module Api
	module V1

		class UserController < ApplicationController

			def index
				users = User.all
				render json: {status:'SUCCESS', message: 'Todos los usuarios', data:users}, status: :ok
			end

			def create
				# entrega vista de formulario para crear nuevo usuario
			end

			def store
				nombre = params[:nombre]
				lastName = params[:lastName]
				gender = params[:gender]
				email = params[:email]
				role_id = params[:role_id]
				username = params[:username]
				password = params[:password]
				# personas = Person.new(:nombre => nombre, :fecha_nacimiento => fecha, :descripcion => descrip)
				# personas.save
				# render json: {status: 'SUCCESS',message:'Listado de personas', data:personas}, status: :ok
				# guarda usuario con datos de def create
			end

			def show 
				user = User.find(params[:id])
				render json: {status:'SUCCESS', message: 'Usuario específico', data:user}, status: :ok
			end

			def edit
				# entrega vista de formulario para editar un usuario
			end

			def update
				# guarda cambios de datos de usuario de def edit
			end

			def destroy
			end

		end

	end
end