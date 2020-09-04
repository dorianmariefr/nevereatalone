Rails.application.routes.draw do
  ActiveAdmin.routes(self)

  resources :users
  resource :session
  resources :availabilities
  resources :messages
  resources :comments

  resources :invitations do
    post "accept" => "invitations#accept"
    post "decline" => "invitations#decline"
  end

  get "auth/facebook/callback", to: "sessions#facebook"

  get "privacy" => "pages#privacy"
  get "terms" => "pages#terms"

  root to: "pages#home"
end
