Rails.application.routes.draw do
  get 'reviews/create'
  get 'reviews/show'
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root "home#index"
  resources :users do
    resources :reviews, only: [:index, :new, :create]
  end
  resources :posts_g, except: :show
  resources :posts_c, except: :show
  

  resources :groups, only: [:index] do
    resources :messages, only: [:index, :create]
    namespace :api do
      resources :messages, only: :index, defaults: { format: 'json' }
    end
  end

  get '/posts_g/:id/destroy', to: 'posts_g#destroy'
  get '/posts_c/:id/destroy', to: 'posts_c#destroy'

  get '/groups/:id/create', to: 'groups#create'
end