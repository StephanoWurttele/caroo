Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :cars do
    resources :bookings, only: [:new, :create]
  end
  resources :users, only: [:show]
  resources :bookings, only: [:index, :show]
end