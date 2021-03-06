module Api
	module V1
		class CatedrasController < ApplicationController

			def index
				catedras = Catedra.where(:category_id => params[:category_id]).all
				if catedras.any?
					render json: {
						status:'SUCCESS', 
						message: 'Todas las Cátedras de la categoría ' + params[:category_id], 
						data: catedras
					}, status: :ok
				else
					render json: {
						status: 'ERROR',
						message: 'No existen Cátedras en la Categoría ' + params[:category_id],
						data: catedras
					}, status: :unprocessable_entity
				end
			end

			def create
				catedra = Catedra.new(catedra_params)
				if catedra.save
					render json: {
						status: 'SUCCESS', 
						message: 'Se ha ingresado nueva Cátedra a la categoría ' + params[:category_id], 
						data: catedra
					}, status: :ok
				else
					render json: {
						status: 'ERROR',
						message: 'Cátedra no Guardada',
						data: catedra.errors
					}, status: :unprocessable_entity					
				end
			end

			def show 
				catedra = Catedra.find(params[:id]) 
				render json: {
					status:'SUCCESS', 
					message: 'Cátedra específica de categoría ' + catedra.category_id.to_s, 
					data: catedra
				}, status: :ok
			end

			def update
				catedra = Catedra.find(params[:catedra_id])
				if catedra.update_attributes(catedra_params)
					render json: {
						status: 'SUCCESS', 
						message: 'Se ha actualizado Cátedra de la categoría ' + catedra.category_id.to_s, 
						data: catedra
					}, status: :ok
				else
					render json: {
						status: 'ERROR',
						message: 'Cátedra no Actualizada',
						data: catedra.errors
					}, status: :unprocessable_entity
				end
			end

			def destroy
				catedra = Catedra.find(params[:catedra_id])
    			if catedra.destroy
	    			render json: {
						status: 'SUCCESS', 
						message:'Se ha eliminado la Cátedra de la categoría ' + catedra.category_id.to_s, 
						data: catedra
					}, status: :ok
				else
	    			render json: {
						status: 'ERROR', 
						message:'No se pudo eliminar la Cátedra', 
						data: catedra.errors
					}, status: :unprocessable_entity
				end
			end

			def getTeacherName
				catedra = Catedra.find(params[:catedra_id])
				teacher = Teacher.where(:id => catedra.teacher_id).first
				user = User.where(:id => teacher.user_id).first
				if user
					render json: {
						status: 'SUCCESS', 
						message:'el nombre del profesor de la catedra: ' + catedra.id.to_s + ' es: ' + user.nombre + ' ' + user.lastName, 
						data: user.nombre.capitalize + ' ' + user.lastName.capitalize 
					}, status: :ok
				else
	    			render json: {
						status: 'ERROR', 
						message:'No se pudo encontrar el profesor de la cátedra', 
						data: user.errors
					}, status: :unprocessable_entity
				end
			end 

			private
				def catedra_params
					params.permit(:category_id, :teacher_id, :title, :description, :img)
				end	


		end
	end
end