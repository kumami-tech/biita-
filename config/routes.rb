Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root "home#index"
  resources :users, only: [:index, :edit, :update]
  resources :posts_g
  resources :posts_c
end
