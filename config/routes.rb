Rails.application.routes.draw do
  require "sidekiq/web"
  mount Sidekiq::Web, at: "/sidekiq"

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  authenticated :user, ->(u) { u.admin? } do
    namespace :admin do
      root to: "dashboard#show"
    end
  end

  authenticated :user do
    root to: "dashboard#show", as: :user_root
  end

  namespace :api do
    namespace :v1 do
      get "health_check", to: "health_check#index"
    end
  end

  root "static#index"

  namespace :account do
    resource :password
  end

  resources :feeds
  resources :entries, only: :index, path: "outputs"

  resources :feeds do
    resource :update, only: :update, module: :feeds
  end

  resources :questions do
    resource :solve, only: :update, module: :questions
    resources :comments, module: :questions
    collection do
      post :search
    end
  end

  namespace :markdown do
    resource :preview, only: :create
  end

  resources :notifications, only: :index
  resources :integrations
end
