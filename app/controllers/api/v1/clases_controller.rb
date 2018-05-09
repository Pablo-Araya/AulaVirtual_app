module Api
	module V1
		class ClasesController < ApplicationController

			def index
				clases = Clase.where(:catedra_id => params[:catedra_id]).all
				if clases.any?
					render json: {
						status:'SUCCESS', 
						message: 'Todas las Clases de la Cátedra ' + params[:catedra_id], 
						data: clases
					}, status: :ok
				else
					render json: {
						status: 'ERROR',
						message: 'No existen Clases en la Cátedra ' + params[:catedra_id],
						data: clases
					}, status: :unprocessable_entity
				end
			end

			def create
				clase = Clase.new(clase_params)

				if clase.save
					render json: {
						status: 'SUCCESS', 
						message: 'Se ha ingresado nueva Clase a la Cátedra ' + params[:catedra_id], 
						data: clase
					}, status: :ok
				else
					render json: {
						status: 'ERROR',
						message: 'Clase no Guardada',
						data: clase.errors
					}, status: :unprocessable_entity					
				end
			end

			def show 
				clase = Clase.find(params[:id]) 
				render json: {
					status:'SUCCESS', 
					message: 'Clase específica de Cátedra ' + clase.catedra_id.to_s, 
					data: clase
				}, status: :ok
			end

			def update
				clase = Clase.find(params[:id])
				if clase.update_attributes(clase_params)
					render json: {
						status: 'SUCCESS', 
						message: 'Se ha actualizado Clase de la Cátedra ' + clase.catedra_id.to_s, 
						data: clase
					}, status: :ok
				else
					render json: {
						status: 'ERROR',
						message: 'Clase no Actualizada',
						data: clase.errors
					}, status: :unprocessable_entity
				end
			end

			def destroy
				clase = Clase.find(params[:id])
    			if clase.destroy
	    			render json: {
						status: 'SUCCESS', 
						message:'Se ha eliminado la Clase de la Cátedra ' + clase.catedra_id.to_s, 
						data: clase
					}, status: :ok
				else
	    			render json: {
						status: 'ERROR', 
						message:'No se pudo eliminar la Clase', 
						data: clase.errors
					}, status: :unprocessable_entity
				end
			end

			private
				def clase_params
					params.permit(:catedra_id, :title, :description)
				end	

		end
	end
end