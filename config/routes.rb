Rails.application.routes.draw do
  devise_for :users, path: '/profile'
  root 'static_pages#index'
  resource :users, path: '/profile'
  get '/contact', to: 'static_pages#contact'
  get '/histoire', to: 'static_pages#about'
  get '/informations', to: 'static_pages#info'
  get '/galerie', to: 'static_pages#galerie'
end
