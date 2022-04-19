Rails.application.routes.draw do
  
  devise_for :users
  get 'merchandises/index'
  root to: "merchandises#index"
  resources :merchandises, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :purchases, only: [:index, :create] do
    resources :addresses, only: [:index, :create]
    end
  end
end
