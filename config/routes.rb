Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root "home#index"
  resources :users
  # resources :users, only: [:show, :edit, :update]
  resources :posts_g
  resources :posts_c
  resources :groups
  resources :messages
  get '/posts_g/:id/destroy', to: 'posts_g#destroy'
  get '/posts_c/:id/destroy', to: 'posts_c#destroy'
end