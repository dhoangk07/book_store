Rails.application.routes.draw do


  resources :books
  resources :publishers
  resources :editors
  resources :comments
  resources :reviews
  resources :customers

  root to: 'books#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
