module Api
	module V1
		class ClasesController < ApplicationController

			def index
				clases = Clase.where('catedra_id' => [:catedra_id])
			end

			def create
				# entrega vista de formulario para crear nueva clase en cátedra
			end

			def store
				# guarda nueva clase con datos de def create
			end

			def show 
				clase = Clase.find(params[:id])
			end

			def edit
				# entrega vista de formulario para editar una clase
			end

			def update
				# guarda cambios de datos de la clase de def edit
			end

			def destroy
			end
			
		end
	end
end
