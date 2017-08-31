Rails.application.routes.draw do
  
  get 'about/index'

  resources "contacts", only: [:new, :create]

  root 'contacts#new'
  post 'notification', to: 'notification#create'

  get 'order/new'

  post 'order/create'

  get 'order/index'

  resources :products
  resources :businesses
  # root 'home#home'
  get 'map' => 'home#map', as: 'map'
  get 'json-map' => 'home#json_map', as: 'json-map'

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # sessions
  resources :sessions, only: %i[new create destroy]
end
