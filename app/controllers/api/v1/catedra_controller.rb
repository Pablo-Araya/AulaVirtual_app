module Api
	module V1
		class CatedraController < ApplicationController

			def index
				catedras = Catedra.all
			end

			def create
				# entrega vista de formulario para crear nueva Catedra
			end

			def store
				# guarda Catedra con datos de def create
			end

			def show 
				catedra = Catedra.find(params[:id])
			end

			def edit
				# entrega vista de formulario para editar una Catedra
			end

			def update
				# guarda cambios de datos de Catedra de def edit
			end

			def destroy
			end

		end
	end
end
