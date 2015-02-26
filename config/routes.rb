Rails.application.routes.draw do
  root 'welcome#index'

 get '/registration' => 'registration#new'

  resources :tasks, :users, :projects
  resources :sessions, only: [:create]

  get '/login' => 'sessions#new'
  get '/logout' => 'sessions#destroy'
  post '/login' => 'sessions#create'

  

  get '/faq' => 'faq#index'
  get '/about' => 'about#index'
  get '/terms' => 'terms#index'
  get '/tasks' => 'tasks#index'
  

  get 'products' => 'catalog#view'


end
