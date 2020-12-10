Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'registrations', omniauth_callbacks: 'callbacks' }
  
  devise_scope :user do
    get '/users/sign_in', to: 'devise/sessions#new'
    post '/users/sign_in', to: 'devise/sessions#create'
    get '/users/sign_up', to: 'devise/sessions#new'
    post '/users/sign_up', to: 'devise/sessions#create'
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end

  get 'games/search_term/:search_term', to: 'games#index'

  get '/users/:id', to: 'users#show'

  
  get '/games/new', to: 'games#new'

  root to: 'welcome#home'

  resources :categories do 
    resources :games, only: [:new, :create, :update, :index]
  end
  resources :games

end
