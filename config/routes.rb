Rails.application.routes.draw do
  get 'users/show'
  root to: 'pages#home'
  devise_for :users
  resources :cars
  resources :users, only: [:show]
end