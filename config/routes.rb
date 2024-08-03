Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  namespace :account do
    resource :password
  end

  authenticate :user do
    root to: "dashboard#show", as: :user_root
  end
end
