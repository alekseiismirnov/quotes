Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :quotes
      resources :users, only: [:show, :create, :update]
      resources :tokens, only: [:create]
    end
  end
end
