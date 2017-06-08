Rails.application.routes.draw do
  resources :businesses
  root 'home#index'
  get 'about' => 'home#about', as: 'about'

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # sessions
  resources :sessions, only: %i[new create destroy]
end
