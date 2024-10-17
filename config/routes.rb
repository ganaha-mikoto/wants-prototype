Rails.application.routes.draw do
  resources :requests, only: [:index, :new, :create]
end
