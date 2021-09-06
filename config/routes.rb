Rails.application.routes.draw do
  root 'books#index'

  resources :books
  resources :users, only: [:show, :edit, :update]
end
