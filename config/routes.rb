Rails.application.routes.draw do
  ActiveAdmin.routes(self)

  resources :users
  resource :session
  resources :availabilities
  resources :messages
  resources :comments
  resources :interests
  resources :direct_messages
  resources :posts

  resources :invitations do
    get "accept" => "invitations#accept"
    post "accept" => "invitations#accept"
    get "decline" => "invitations#decline"
    post "decline" => "invitations#decline"
  end

  get "auth/facebook/callback", to: "sessions#facebook"

  get "privacy" => "pages#privacy"
  get "terms" => "pages#terms"

  root to: "pages#home"
end
