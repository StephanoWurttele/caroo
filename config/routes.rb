Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :cars do
    resources :bookings, only: [:new, :create]
    resources :reviews, only: [:new, :create ]
  end
  resources :users, only: [:show]
  resources :search, only: [:index]
  resources :bookings, only: [:index, :show]
  resources :reviews, only: [:edit, :update, :destroy]
end
