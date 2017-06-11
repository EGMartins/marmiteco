Rails.application.routes.draw do
  resources :businesses
  root 'home#home'
  get 'map' => 'home#map', as: 'map'

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # sessions
  resources :sessions, only: %i[new create destroy]
end
