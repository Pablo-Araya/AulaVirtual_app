module Api
	module V1
		class UserTokensController < ApplicationController

			def createToken
				token = UserToken.where(:user_id => params[:user_id]).first
				if !token.nil?
					token.update_attributes(token_params)
					render json: {
						status: 'SUCCESS', 
						message: 'Se ha actualizado Token de seguridad con el user ' + token.user_id.to_s, 
						resToken: token
					}, status: :ok
				else
					newToken = UserToken.new(token_params)
					if newToken.save
						render json: {
							status: 'SUCCESS', 
							message: 'Se ha ingresado nuevo Token de seguridad con el user ' + params[:user_id], 
							resToken: newToken
						}, status: :ok
					else
						render json: {
							status: 'ERROR',
							message: 'Token Error',
							resToken: newToken.errors
						}, status: :unprocessable_entity
					end
				end
			end

			def getToken
				token = UserToken.where(:user_id => params[:user_id]).where("updated_at > ?", 30.minutes.ago).first
				oldTokens = UserToken.where("updated_at < ?", 30.minutes.ago).all
				oldTokens.destroy_all
				if !token.nil?
					render json: {
						status: 'SUCCESS', 
						message: 'Se encontró un registro actualizado hace menos de 30 minutos', 
						resToken: token
					}, status: :ok
				else 
					render json: {
						status: 'ERROR', 
						message: 'No existen tokens registrados al usuario', 
						resToken: token
					}, status: :unprocessable_entity
				end
			end

			def destroyToken
				token = UserToken.where(:user_id => params[:user_id])
				if token.destroy
					render json: {
						status: 'SUCCESS', 
						message:'Se han eliminado token: ' + token.user_id.to_s + ' hasta pronto !', 
						resToken: token
					}, status: :ok
				else
					render json: {
						status: 'ERROR',
						message: 'No se pudo eliminar porque no existe el Token',
						resToken: token
					}, status: :unprocessable_entity
				end
			end

			private
				def token_params
					params.permit(:user_id, :token_security)
				end	
		end
	end
end
