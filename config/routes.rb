Rails.application.routes.draw do
  devise_for :users
  resources :requests do
    resources :prodects, only: [:index, :create]
  end
  root to: "requests#index"
end
