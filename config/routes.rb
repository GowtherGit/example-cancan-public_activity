Rails.application.routes.draw do
  resources :sales

  resources :products

  devise_for :users
  root to: 'home#index'

  # public_activity
  resources :activities
end
