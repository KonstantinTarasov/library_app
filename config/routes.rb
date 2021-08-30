Rails.application.routes.draw do
  root 'book#index'

  resources :book
  resources :user, only: [:show, :edit, :update]
end
