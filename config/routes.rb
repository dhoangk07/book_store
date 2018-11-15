Rails.application.routes.draw do
  devise_for :users
  resources :books
  resources :publishers
  resources :editors
  resources :comments
  resources :reviews
  resources :customers
  resources :categories
  resources :locations
  resources :dashboards
  resources :orders
  root to: 'books#index'
end
