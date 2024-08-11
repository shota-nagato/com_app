Rails.application.routes.draw do
  require "sidekiq/web"
  mount Sidekiq::Web, at: "/sidekiq"

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  namespace :account do
    resource :password
  end

  authenticate :user do
    root to: "dashboard#show", as: :user_root
  end

  resources :feeds
end
