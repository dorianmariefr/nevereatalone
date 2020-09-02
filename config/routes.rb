Rails.application.routes.draw do
  resources :users do
    get "account" => "users#account"
  end

  resource :session

  root to: "pages#home"
end
