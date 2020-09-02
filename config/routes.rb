Rails.application.routes.draw do
  resources :users do
    get "account" => "users#account"
  end

  resource :session

  get "auth/facebook/callback", to: "sessions#facebook"

  root to: "pages#home"
end
