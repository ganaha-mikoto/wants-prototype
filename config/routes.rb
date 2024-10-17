Rails.application.routes.draw do
  devise_for :users
  resources :requests, only: [:index, :new, :create]
  root to: "requests#index"
end
