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
      post '/images', to: 'projects#images'
      resources :users
      get '/user', to: 'users#user'
      resources :projects do
        resources :notes, module: :projects
        get '/lists-search', to: "projects#lists_search"
        resources :lists, module: :projects do 
          resources :tasks
        end
        resources :features do
          resources :notes, module: :features
          get '/lists-search', to: "features#lists_search"
          resources :lists, module: :features do
            resources :tasks
          end
        end
      end
    end    
  end
end