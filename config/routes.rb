Rails.application.routes.draw do
  root 'home_pages#home'
  resources :users
  match '/signup', to: 'users#new', via: 'get'
end
