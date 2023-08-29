Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'pages#home'

  resources :alpacas, only: %i[index show new create destroy] do
    resources :bookings, only: %i[new create]
  end

  resources :bookings, only: %i[show edit update] do
    collection do
      get 'user_bookings'
    end
  end
end
