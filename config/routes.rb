Rails.application.routes.draw do
  get 'ownerships/create'
  get 'ownerships/destroy'
  root to: "toppages#index"
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'signup', to: 'users#new'
  resources :users, only: [:show, :create, :edit, :update] 
  resources :items, only: [:show, :index]
  resources :ownerships, only: [:create, :destroy]
end