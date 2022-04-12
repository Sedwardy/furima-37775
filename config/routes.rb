Rails.application.routes.draw do
  get 'articles/index'
  get 'articles/new'
  devise_for :users
  get 'merchandises/index'
  root to: "merchandises#index"
  resources :merchandises, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  
  resources :articles
end
