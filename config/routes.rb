Rails.application.routes.draw do
  get 'reviews/create'
  get 'reviews/show'
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root "home#index"
  resources :users do
    resources :reviews, only: [:index, :create]
  end
  resources :posts_g
  resources :posts_c
  

  resources :groups, only: [:index, :show] do
    resources :messages, only: [:index, :create]
  end

  get '/posts_g/:id/destroy', to: 'posts_g#destroy'
  get '/posts_c/:id/destroy', to: 'posts_c#destroy'

  get '/groups/:id/create', to: 'groups#create'
end