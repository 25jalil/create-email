Rails.application.routes.draw do

  root 'home_pages#home'
  match '/all_mail',    to: 'home_pages#all_mails',   via: 'get'
  match '/sent_mail',   to: 'home_pages#sent_mails',  via: 'get'
  match '/inbox_mail',  to: 'home_pages#inbox_mails', via: 'get'


  resources :users, except: [:index]
  match '/all_users',   to: 'users#index',           via: 'get'

  resources :sessions, only: [:new, :create, :destroy]
  match '/signin',      to: 'sessions#new',          via: 'get'
  match '/signout',     to: 'sessions#destroy',      via: 'delete'


  resources :conversations, only: :create
end
