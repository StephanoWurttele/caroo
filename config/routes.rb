Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :cars do
    resources :reviews, only: [ :index, :show, :new, :create ]
  end
  resources :users, only: [:show]
  resources :bookings
end
