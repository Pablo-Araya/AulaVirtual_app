module Api
	module V1

		class UsersController < ApplicationController

			def index
				users = User.all
				render json: {
					status:'SUCCESS', 
					message: 'Todos los usuarios', 
					data:users
				}, status: :ok
			end

			def create
				# entrega vista de formulario para crear nuevo usuario
				render json: {
					status:'SUCCESS', 
					message: 'Yo entregaré la vista con el formulario para crear a un Nuevo Usuario', 
					data: ''
				}, status: :ok
			end

			def store
				nombre = params[:nombre]
				lastName = params[:lastName]
				gender = params[:gender]
				email = params[:email]
				role_id = params[:role_id]
				username = params[:username]
				password = params[:password]
				user = User.new(
					:nombre => nombre,
					:lastName => lastName,
					:gender => gender,
					:email => email,
					:role_id => role_id,
					:username => username,
					:password => password,
					)
				if user.save
					render json: {
						status: 'Success', 
						message:'Se ha ingresado nuevo Usuario', 
						data:user
					}, status: :created
				else
					render json: {
						:errors => user.errors.full_messages
					}, status => 422
				end
			end

			def show 
				user = User.find(params[:id])
				render json: {
					status:'SUCCESS', 
					message: 'Usuario específico', 
					data:user
				}, status: :ok
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