Rails.application.routes.draw do
  resources :quotes
  resources :users, only: [:show, :create, :update]
  resources :tokens, only: [:create]
end
