Rails.application.routes.draw do
  post "/login", to: 'authentication#login'
  namespace :api do 
    namespace :v1 do 
      resources :tasks, only: [:create, :destroy, :update]
      resources :goals, only: [:create, :index, :show, :destroy, :update]
      resources :users, only: [:create, :show]
      get "/user", to: 'users#user'
      put "complete-task/:id", to: 'tasks#complete_task'
      put "complete-goal/:id", to: 'goals#complete_goal'
    end
    namespace :v2 do 

      resources :users
      get '/user', to: 'users#user'
      resources :projects do
        resources :notes, module: :projects
        resources :lists, module: :projects do 
          resources :tasks
        end
        resources :features do
          resources :notes, module: :features
          resources :lists, module: :features
        end
      end
    end    
  end
end