Rails.application.routes.draw do
	# rutas para el user resource
	get "user", to: "user#index"
	get "user/create", to: "user#create"
	post "user", to: "user#store"
	get "user/:id", to: "user#show"
	get "user/:id/edit", to: "user#edit"
	patch "user/:id", to: "user#update"
	put "user/:id", to: "user#update"
	delete "user/:id", to: "user#destroy"
end