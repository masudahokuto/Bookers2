Rails.application.routes.draw do

  resources :books, only: [:show, :edit, :new]
  devise_for :users
  root to: 'homes#top'
  get 'homes/about', to: 'homes#about', as: 'about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end