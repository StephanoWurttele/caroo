Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  root to: 'pages#home'
  devise_for :users
  resources :cars do
    resources :bookings, only: [:new, :create]
    resources :reviews, only: [:new, :create ]
  end
  resources :users, only: [:show]
  resources :bookings, only: [:index, :show]
end
