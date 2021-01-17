Rails.application.routes.draw do
  devise_for :users
  root to: "top#index"
  resources :top, only: [:index]
  resources :items do
    resources :purchases, only: [:index, :create]
  end
end
