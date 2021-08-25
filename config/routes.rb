Rails.application.routes.draw do
  get 'user/show'
  get 'user/edit'
  get 'user/update'
  root 'books#index'

  resources :book
  resources :user, only: [:show, :edit, :update]
end
