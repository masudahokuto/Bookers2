Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :edit, :update, :index]
  resources :books, only: [:show, :edit, :create, :update, :index, :destroy]
  root to: 'homes#top'
  get 'home/about', to: 'homes#about', as: 'about'
end
