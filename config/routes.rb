Rails.application.routes.draw do
  resources :users
  resource :session
  resources :availabilities

  get "auth/facebook/callback", to: "sessions#facebook"

  root to: "pages#home"
end
