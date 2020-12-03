Rails.application.routes.draw do
  devise_for :users, path: '/profile'
  resource :users, path: '/profile'

  resources :orders
  resources :items
  resources :item_carts

  get '/contact', to: 'static_pages#contact'
  get '/notre-histoire', to: 'static_pages#about'
  get '/informations', to: 'static_pages#info'
  get '/galerie', to: 'static_pages#galerie'
  resources :carts
  get '/acceuil', to: 'static_pages#index'
  get '/abonemments', to: 'items#index'
  post '/item_carts/:id', to: 'item_carts#create', as: 'panier'

  root 'static_pages#index'
end
