Rails.application.routes.draw do
  resources :users

  resource :session

  get "auth/facebook/callback", to: "sessions#facebook"

  root to: "pages#home"
end
