Rails.application.routes.draw do
  resources :service_orders, only: :create
  # resources :services
  # resources :clients
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
