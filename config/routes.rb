Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  authenticate :user do
    root to: "dashboard#show", as: :user_root
  end
end
