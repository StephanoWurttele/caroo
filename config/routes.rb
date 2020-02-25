Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :cars
  resources :users, only: [:show]
  resources :bookings
  resources :search, only: [:index]
end
