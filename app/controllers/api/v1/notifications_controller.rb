module Api
	module V1
		class NotificationsController < ApplicationController

			def index
				notifications = Notification.where(:clase_id => params[:clase_id]).all
				if notifications.any?
					render json: {
						status:'SUCCESS', 
						message: 'Todas las Notificaciones de la Clase ' + params[:clase_id], 
						data: notifications
					}, status: :ok
				else
					render json: {
						status: 'ERROR',
						message: 'No existen Notificaciones en la Clase ' + params[:clase_id],
						data: notifications
					}, status: :unprocessable_entity
				end
			end

			def create
				notification = Notification.new(notification_params)

				if notification.save
					render json: {
						status: 'SUCCESS', 
						message: 'Se ha ingresado nueva Notificación a la Clase ' + params[:clase_id], 
						data: notification
					}, status: :ok
				else
					render json: {
						status: 'ERROR',
						message: 'Notificación no Guardada',
						data: notification.errors
					}, status: :unprocessable_entity					
				end
			end

			def show 
				notification = Notification.find(params[:id]) 
				render json: {
					status:'SUCCESS', 
					message: 'Notificación específica de Clase ' + notification.clase_id.to_s, 
					data: notification
				}, status: :ok
			end

			def update
				notification = Notification.find(params[:id])
				if notification.update_attributes(notification_params)
					render json: {
						status: 'SUCCESS', 
						message: 'Se ha actualizado Notificación de la Clase ' + notification.clase_id.to_s, 
						data: notification
					}, status: :ok
				else
					render json: {
						status: 'ERROR',
						message: 'Notificación no Actualizada',
						data: notification.errors
					}, status: :unprocessable_entity
				end
			end

			def destroy
				notification = Notification.find(params[:id])
    			if notification.destroy
	    			render json: {
						status: 'SUCCESS', 
						message:'Se ha eliminado la Notificación de la Clase ' + notification.clase_id.to_s, 
						data: notification
					}, status: :ok
				else
	    			render json: {
						status: 'ERROR', 
						message:'No se pudo eliminar la Notificación', 
						data: notification.errors
					}, status: :unprocessable_entity
				end
			end

			private
				def notification_params
					params.permit(:clase_id, :title, :description)
				end	

		end
	end
end