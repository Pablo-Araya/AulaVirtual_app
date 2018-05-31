Rails.application.routes.draw do
	namespace 'api' do
		namespace 'v1' do

			post "login", to: "users#login"
			
			resources :users do
				post "auth", to: "user_tokens#createToken"
				get "auth", to: "user_tokens#getToken"
				delete "auth", to: "user_tokens#destroyToken"
				get "misCursos", to: "cursos#index"
				post "misCursos", to: "cursos#create"
				delete "misCursos/:id", to: "cursos#destroy"
				get "misCatedras", to: "cursos#indexTeacher"
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