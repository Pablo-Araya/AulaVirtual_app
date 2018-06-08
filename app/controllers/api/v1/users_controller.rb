module Api
	module V1
		class UsersController < ApplicationController
			
			def login
				userLog = User.where(username: params[:username]).first
				if userLog
					if userLog.password == params[:password]
						render json: {
							status:'SUCCESS', 
							message: 'Usuario autenticado', 
							data: userLog
						}, status: :ok
					else
						render json: {
							status:'ERROR', 
							message: 'Datos incorrectos'
						}, status: :unprocessable_entity
					end
				else
					render json: {
						status:'ERROR', 
						message: 'Datos incorrectos'
					}, status: :unprocessable_entity
				end
			end

			def index
				users = User.all
				render json: {
					status:'SUCCESS', 
					message: 'Todos los usuarios', 
					data: users
				}, status: :ok
			end

			def create
				user = User.new(user_params)
				if user.save
					role = user.role_id
					if role == 2
						foreign = Teacher.new(:user_id => user.id)
						foreign.save
					elsif role == 3
						foreign = Student.new(:user_id => user.id)
						foreign.save
					else
						user.destroy
						render json: {
							status: 'ERROR',
							message: 'No puede crear un usuario con otro rol'
						}, status: :unprocessable_entity
						return false	
					end
					render json: {
						status: 'SUCCESS', 
						message: 'Se ha ingresado nuevo Usuario', 
						data: [user, foreign]
					}, status: :ok
				else
					render json: {
						status: 'ERROR',
						message: 'Usuario no Guardado',
						data: user.errors
					}, status: :unprocessable_entity					
				end
			end

			def show 
				user = User.find(params[:id]) 
				render json: {
					status:'SUCCESS', 
					message: 'Usuario específico', 
					data: user
				}, status: :ok
			end

			def update
				user = User.find(params[:id])
				if user.update_attributes(user_params)
					render json: {
						status: 'SUCCESS', 
						message: 'Se ha actualizado Usuario', 
						data: user
					}, status: :ok
				else
					render json: {
						status: 'ERROR',
						message: 'Usuario no Actuaizado',
						data: user.errors
					}, status: :unprocessable_entity
				end
			end

			def destroy
				user = User.find(params[:id])
				role = user.role_id

				if role == 2
					teacher = Teacher.where(:user_id => user.id).first
					teacher.destroy
				else
					student = Student.where(:user_id => user.id).first
					if !student.nil?
						student.destroy
					end
				end
    			
    			if user.destroy
    				render json: {
						status: 'SUCCESS', 
						message:'Se ha eliminado Usuario', 
						data: user
					}, status: :ok
				else
					render json: {
						status: 'ERROR', 
						message:'No se pudo eliminar al Usuario', 
						data: user.errors
					}, status: :unprocessable_entity
				end
			end

			private
				def user_params
					params.permit(:nombre,:lastName,:gender,:email,:role_id,:username,:password)
				end	

		end
	end
end