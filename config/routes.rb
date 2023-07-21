require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: "pages#home"
  mount Sidekiq::Web => '/sidekiq'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  authenticated :user do
    root to: 'pages#home', as: :authenticated_root
  end

  # Defines the root path route ("/")
  # root "articles#index"
  resources :lists
  resources :gifts, except: [:index]
  resources :posts
  resources :recommendations, only: [:index, :show] do
    collection do
      get :generate
    end
  end
end
