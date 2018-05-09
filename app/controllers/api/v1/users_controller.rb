module Api
	module V1
		class UsersController < ApplicationController
						
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
					foreign = Teacher.where(:user_id => user.id).first
					foreign.destroy
				else
					foreign = Student.where(:user_id => user.id).first
					if !foreign.nil?
						foreign.destroy
					end
				end
    			user.destroy
    			render json: {
					status: 'SUCCESS', 
					message:'Se ha eliminado Usuario', 
					data: [user, foreign]
				}, status: :ok
			end

			private
				def user_params
					params.permit(:nombre,:lastName,:gender,:email,:role_id,:username,:password)
				end	

		end
	end
end