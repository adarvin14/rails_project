Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'registrations', omniauth_callbacks: 'callbacks' }
  
  devise_scope :user do 
    get 'login', to: 'devise/sessions#new', as: 'login'
    get 'signup', to: 'devise/registrations#new', as: 'signup'
  end

  root to: 'welcome#home'

  resources :categories do 
    resources :games, only: [:new, :create, :index]
  end
  resources :games

end
