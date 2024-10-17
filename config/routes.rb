Rails.application.routes.draw do
  resources :requests, only: [:index, :new, :create]
  root to: "requests#index"
end
