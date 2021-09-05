Rails.application.routes.draw do
  root 'books#index'

  resources :books
  resources :user, only: [:show, :edit, :update]
end
