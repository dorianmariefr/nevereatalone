Rails.application.routes.draw do
  resources :users
  resource :session
  resources :availabilities
  resources :messages

  resources :invitations do
    post "accept" => "invitations#accept"
    post "decline" => "invitations#decline"
  end

  get "auth/facebook/callback", to: "sessions#facebook"

  root to: "pages#home"
end
