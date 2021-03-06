Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  root 'home#index'
  resources :users do
    resources :reviews, only: %i[index new create]
    member do
      get 'followings', to: 'relationships#followings'
      get 'followers', to: 'relationships#followers'
    end
  end

  resources :posts_g do
    member do
      get 'take'
      get 'cancel'
    end
    resource :favorite_gs, only: %i[create destroy]
  end

  resources :posts_c do
    member do
      get 'take'
      get 'cancel'
    end
    resource :favorite_cs, only: %i[create destroy]
  end

  resources :groups, only: :index do
    resources :messages, only: %i[index create]
    namespace :api do
      resources :messages, only: :index, defaults: { format: 'json' }
    end
  end

  resources :notifications, only: %i[index destroy]
  get '/notifications/destroy_all', to: 'notifications#destroy_all'

  resources :relationships, only: %i[create destroy]

  get '/posts_g/:id/destroy', to: 'posts_g#destroy'
  get '/posts_c/:id/destroy', to: 'posts_c#destroy'

  get '/groups/:id/create', to: 'groups#create'
end
