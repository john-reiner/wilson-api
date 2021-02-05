Rails.application.routes.draw do
  resources :tasks, only: [:create]
  resources :goals, only: [:create, :index, :show]
  resources :users, only: [:create, :show]
  get "/user", to: 'users#user'
  post "login", to: 'authentication#login'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
