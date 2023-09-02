Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'pages#home'
  get 'user_profile', to: 'pages#user_profile'

  resources :alpacas, only: %i[index show new create destroy] do
    collection do
      get 'hat_search'
    end
    resources :bookings, only: %i[new create]
    resources :reviews, only: :create
  end

  resources :bookings, only: %i[show edit update destroy] do

    resources :reviews, only: [:new, :create]
    collection do
      get 'user_bookings'
    end
  end
end
