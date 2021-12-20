Rails.application.routes.draw do
  devise_for :users
  root 'books#index'

  resources :books do
    resources :comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update, :destroy]
end
