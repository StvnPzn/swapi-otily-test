Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'

  resources :films, only: [:index, :show]
  resources :planets, only: [:index, :show]
  resources :species, only: [:index, :show]
  resources :starships, only: [:index, :show]
  resources :vehicles, only: [:index, :show]
  resources :characters, only: [:index, :show]
end
