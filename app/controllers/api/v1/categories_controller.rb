module Api
	module V1
		class CategoriesController < ApplicationController

			def index
				categories = Category.all
				render json: {
					status:'SUCCESS', 
					message: 'Todas las categorías', 
					data: categories
				}, status: :ok
			end

			def create
				category = Category.new(category_params)

				if category.save
					render json: {
						status: 'SUCCESS', 
						message: 'Se ha ingresado nueva Categoría', 
						data: category
					}, status: :ok
				else
					render json: {
						status: 'ERROR',
						message: 'Categoría no Guardada',
						data: category.errors
					}, status: :unprocessable_entity					
				end
			end

			def show 
				category = Category.find(params[:id]) 
				render json: {
					status:'SUCCESS', 
					message: 'Categoría específica', 
					data: category
				}, status: :ok
			end

			def update
				category = Category.find(params[:id])
				if category.update_attributes(category_params)
					render json: {
						status: 'SUCCESS', 
						message: 'Se ha actualizado Categoría', 
						data: category
					}, status: :ok
				else
					render json: {
						status: 'ERROR',
						message: 'Categoría no Actuaizada',
						data: category.errors
					}, status: :unprocessable_entity
				end
			end

			def destroy
    			render json: {
					status: 'ERROR', 
					message:'No está permitido eliminar categorías', 
					data: ''
				}, status: :unprocessable_entity
			end

			private
				def category_params
					params.permit(:title, :icon, :description)
				end	

		end
	end
end
