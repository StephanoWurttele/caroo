Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users do
    resources :cars
  end
end
