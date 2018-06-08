module Api
	module V1
		class CatedraSurveysController < ApplicationController

			def index
				surveys = CatedraSurvey.where(:catedra_id => params[:catedra_id]).all
				if surveys.any?
					render json: {
						status:'SUCCESS', 
						message: 'Todas las Calificaciones de la Cátedra ' + params[:catedra_id], 
						data: surveys.count
					}, status: :ok
				else
					render json: {
						status: 'ERROR',
						message: 'No existen Calificaciones en la Cátedra ' + params[:catedra_id],
						data: surveys.count
					}, status: :unprocessable_entity
				end
			end

			def create
				e = CatedraSurvey.where(:catedra_id => params[:catedra_id]).where(:student_id => params[:student_id]).first
				if e.nil?
					survey = CatedraSurvey.new(survey_params)
					if survey.save
						render json: {
							status: 'SUCCESS', 
							message: 'Se ha ingresado nueva Calificación a la Cátedra ' + params[:catedra_id], 
							data: survey
						}, status: :ok
					else
						render json: {
							status: 'ERROR',
							message: 'Calificación no Guardada',
							data: survey.errors
						}, status: :unprocessable_entity					
					end
				else
					render json: {
						status: 'ERROR',
						message: 'Ya ha calificado esta Cátedra'
					}, status: :unprocessable_entity
				end
			end

			def show 
				survey = CatedraSurvey.find(params[:id]) 
				render json: {
					status:'SUCCESS', 
					message: 'Calificación específica de Cátedra ' + survey.catedra_id.to_s, 
					data: survey
				}, status: :ok
			end

			def update
				survey = CatedraSurvey.find(params[:id])
				if survey.update_attributes(:key)
					render json: {
						status: 'SUCCESS', 
						message: 'Se ha actualizado Calificación de la Cátedra ' + survey.catedra_id.to_s, 
						data: survey
					}, status: :ok
				else
					render json: {
						status: 'ERROR',
						message: 'Calificación no Actualizada',
						data: survey.errors
					}, status: :unprocessable_entity
				end
			end

			def destroy
				survey = CatedraSurvey.find(params[:id])
    			if survey.destroy
	    			render json: {
						status: 'SUCCESS', 
						message:'Se ha eliminado la Calificación de la Cátedra ' + survey.catedra_id.to_s, 
						data: survey
					}, status: :ok
				else
	    			render json: {
						status: 'ERROR', 
						message:'No se pudo eliminar la Calificación', 
						data: survey.errors
					}, status: :unprocessable_entity
				end
			end

			def avg
				surveys = CatedraSurvey.where(:catedra_id => params[:catedra_id]).pluck('key')
				if surveys.any?
					avg = surveys.instance_eval { reduce(:+) / size.to_f }
					render json: {
						status:'SUCCESS', 
						message: 'El promedio de las calificaciones de la Cátedra ' + params[:catedra_id] + ' es: ' + avg.to_s, 
						data: avg
					}, status: :ok
				else
					render json: {
						status: 'ERROR',
						message: 'No existen Calificaciones en la Cátedra ' + params[:catedra_id],
						data: 0
					}, status: :unprocessable_entity
				end
			end

			private
				def survey_params
					params.permit(:catedra_id, :student_id, :key)
				end	

		end
	end
end