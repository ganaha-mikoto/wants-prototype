Rails.application.routes.draw do
  devise_for :users
  resources :requests do
    resources :products
  end
  root to: "requests#index"
end
