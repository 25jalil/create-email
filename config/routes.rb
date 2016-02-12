Rails.application.routes.draw do

  root 'home_pages#home'
  resources :users, except: [:index]
  match '/all_users',  to: 'users#index',            via: 'get'

  resources :sessions, only: [:new, :create, :destroy]

  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
end
