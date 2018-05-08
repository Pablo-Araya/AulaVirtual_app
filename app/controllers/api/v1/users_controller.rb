module Api
	module V1

		class UsersController < ApplicationController
			require 'bcrypt'

			@user = User.new(params[:user].permit(:nombre,:lastName,:gender,:email,:role_id,:username,:password))

			validates :nombre, presence: true, lenght: { in: 2..100 }
			validates :lastName, presence: true, lenght: { in: 2..100 }
			validates :gender, presence: true, lenght: { is: 1 }
			validates :email, presence: true, uniqueness: true, with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
			validates :role_id, presence: true, lenght: { is: 1 }, numericality: { only_integer: true }, in: 1..3
			validates :username, presence: true, lenght: { in: 4..15 }, uniqueness: true
			validates :password, presence: true, lenght: { in: 8..10 }
			
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
				password = BCrypt::Password.create(params[:password])
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
					render status: 200, json: {
						status: 'Success', 
						message:'Se ha ingresado nuevo Usuario', 
						data:user
					}
				else
					render json: {
						:errors => user.errors.full_messages
					}, status => 400					
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