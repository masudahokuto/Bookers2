Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :edit, :update, :index]
  resources :books, only: [:show, :edit, :create, :index]
  root to: 'homes#top'
  get 'homes/about', to: 'homes#about', as: 'about'
end
