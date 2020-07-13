Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  resources :users, only: [:index, :edit, :update]
end
