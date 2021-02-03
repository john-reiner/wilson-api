Rails.application.routes.draw do
  resources :tasks, only: [:create]
  resources :goals, only: [:create, :index]
  resources :users, only: [:create]
  post "login", to: 'authentication#login'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
