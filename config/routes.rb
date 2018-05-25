Rails.application.routes.draw do
	namespace 'api' do
		namespace 'v1' do

			post "login", to: "users#login"
			
			resources :users do
				get "cursos", to: "cursos#index"
				post "cursos", to: "cursos#create"
				delete "cursos/:id", to: "cursos#destroy"
			end

			resources :categories do

				resources :catedras do

					resources :catedra_surveys
					get "avg", to: "catedra_surveys#avg"

					resources :clases do

						resources :notifications						

					end

				end				

			end

		end
	end
end