Rails.application.routes.draw do

  
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
      resources :users do
        resources :projects do 
          resources :features
          resources :project_notes
          resources :project_lists do
            resources :project_list_tasks
          end
          resources :project_tags
        end
      end
    end    
  end
  
  post "login", to: 'authentication#login'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
