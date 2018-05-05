Rails.application.routes.draw do
	namespace 'api' do
		namespace 'v1' do
			# rutas para el users resource
			get "users", to: "users#index"
			get "users/create", to: "users#create"
			post "users", to: "users#store"
			get "users/:id", to: "users#show"
			get "users/:id/edit", to: "users#edit"
			patch "users/:id", to: "users#update"
			put "users/:id", to: "users#update"
			delete "users/:id", to: "users#destroy"
		end
	end
end