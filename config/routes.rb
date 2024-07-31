Rails.application.routes.draw do
  get 'dashboard/show'
  devise_for :users

  authenticate :user do
    root to: "dashboard#show", as: :user_root
  end
end
