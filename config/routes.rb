Rails.application.routes.draw do
  resources :users
  resource :session
  resources :availabilities

  resources :invitations do
    post "accept" => "invitations#accept"
    post "reject" => "invitations#reject"
  end

  get "auth/facebook/callback", to: "sessions#facebook"

  root to: "pages#home"
end
