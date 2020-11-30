Rails.application.routes.draw do
  devise_for :users, path: '/profile'

  resource :users, path: '/profile'
end
