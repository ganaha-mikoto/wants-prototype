Rails.application.routes.draw do
  devise_for :users
  root to: 'requests#index'
  resources :requests do
    resources :products do
      resources :purchases, only: [:index, :create]
    end
  end
end
