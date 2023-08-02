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
  patch 'gifts/:id/assignee_email', to: "gifts#add_assignee_email", as: :add_assignee_email
  patch 'gifts/:id/assignee', to: "gifts#add_assignee", as: :add_assignee
  patch 'gifts/:id/assignee_email_recommendation', to: "recommendations#add_assignee_email", as: :add_assignee_email_recommendation
  patch 'gifts/:id/assignee_recommendation', to: "recommendations#add_assignee", as: :add_assignee_recommendation
  resources :posts
  resources :recommendations, only: [:index, :show, :update] do
    collection do
      get :generate
    end
  end
end
