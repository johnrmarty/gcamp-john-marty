Rails.application.routes.draw do
  root 'welcome#index'

      get '/faq' => 'faq#index'
      get '/about' => 'about#index'
      get '/terms' => 'terms#index'

      get '/login' => 'sessions#new'
      get '/logout' => 'sessions#destroy'
      post '/login' => 'sessions#create'
      get '/registration' => 'registration#new'
      post '/registration' => 'registration#create'

      resources :users
      resources :sessions, only: [:create]

      resources :projects do
            resources :tasks  
            resources :memberships
      end 
end 




