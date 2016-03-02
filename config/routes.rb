Rails.application.routes.draw do

  root 'messages#home'
  match '/all_mail',      to: 'messages#all_mails',    via: 'get'
  match '/sent_mail',     to: 'messages#sent_mails',   via: 'get'
  match '/inbox_mail',    to: 'messages#inbox_mails',  via: 'get'
  match '/show_message',  to: 'messages#show_message', via: 'get'


  resources :users, except: [:index]
  match '/all_users',     to: 'users#index',             via: 'get'

  resources :sessions, only: [:new, :create, :destroy]
  match '/signin',        to: 'sessions#new',            via: 'get'
  match '/signout',       to: 'sessions#destroy',        via: 'delete'


  resources :conversations, only: [:new, :create]
end
