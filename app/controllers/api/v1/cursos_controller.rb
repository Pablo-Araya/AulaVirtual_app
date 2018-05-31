module Api
	module V1
		class CursosController < ApplicationController

			def index
				user = User.find(params[:user_id])
				if user.role_id == 3
					cursos = PivotAlumnoCatedra.where(:student_id => params[:user_id]).all
					if cursos.any?
						render json: {
							status:'SUCCESS', 
							message: 'Todas las Cátedras inscritas por el Alumno ' + params[:user_id], 
							data: cursos
						}, status: :ok
					else
						render json: {
							status: 'ERROR',
							message: 'No existen Cátedras inscritas por el Alumno ' + params[:user_id],
							data: cursos
						}, status: :unprocessable_entity
					end
				else
					render json: {
						status: 'ERROR',
						message: 'Error: el Usuario no es Alumno',
						data: user
					}, status: :unprocessable_entity
				end
			end

			def indexTeacher
				user = User.find(params[:user_id])
				if user.role_id == 2
					catedras = Catedra.where(:teacher_id => params[:user_id]).all
					if catedras.any?
						render json: {
							status:'SUCCESS', 
							message: 'Todas las Cátedras creadas por el Profesor ' + params[:user_id], 
							data: catedras
						}, status: :ok
					else
						render json: {
							status: 'ERROR',
							message: 'No existen Cátedras creadas por el Profesor ' + params[:user_id],
							data: catedras
						}, status: :unprocessable_entity
					end
				else
					render json: {
						status: 'ERROR',
						message: 'Error: el Usuario no es Profesor',
						data: user
					}, status: :unprocessable_entity
				end
			end

			def create
				user = User.find(params[:user_id])
				if user.role_id == 3
					e = PivotAlumnoCatedra.where(:student_id => params[:student_id]).where(:catedra_id => params[:catedra_id]).first
					if e.nil?
						curso = PivotAlumnoCatedra.new(curso_params)
						if curso.save
							render json: {
								status: 'SUCCESS', 
								message: 'Se ha inscrito en un nueva Cátedra id: ' + curso.catedra_id.to_s, 
								data: curso
							}, status: :ok
						else 
							render json: {
								status: 'ERROR', 
								message: 'No se pudo inscribir en la Cátedra', 
								data: curso.errors
							}, status: :ok
						end
					else
						render json: {
							status: 'ERROR',
							message: 'Ya se encuentra inscrito en esta Cátedra',
							data: curso
						}, status: :unprocessable_entity
						return false
					end
				else
					render json: {
						status: 'ERROR',
						message: 'Error: el Usuario no es Alumno',
						data: user
					}, status: :unprocessable_entity
				end
			end

			def destroy
				curso = PivotAlumnoCatedra.find(params[:id])
    			if curso.destroy
	    			render json: {
						status: 'SUCCESS', 
						message:'Se ha desinscrito la Cátedra ' + curso.catedra_id.to_s, 
						data: curso
					}, status: :ok
				else
	    			render json: {
						status: 'ERROR', 
						message:'No se pudo desinscribir la Cátedra', 
						data: curso.errors
					}, status: :unprocessable_entity
				end
			end

			private
				def curso_params
					params.permit(:student_id, :catedra_id)
				end	

		end
	end
end