Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'pages#home'
  get '/apply', to: 'alpacas#new', as: 'apply'

  resources :alpacas, only: %i[index show new create destroy]
end
