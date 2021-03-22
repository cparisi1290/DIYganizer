Rails.application.routes.draw do
  get '/projects/order_by_project_due_date' => 'projects#order_by_project_due_date'
  
  resources :projects
  resources :users
  
  resources :rooms do 
    resources :projects, shallow: true
  end 



  root to: 'sessions#welcome'

  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
end
