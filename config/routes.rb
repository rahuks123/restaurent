Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :menus
  resources :menu_items
  resources :order_items
  resources :users
  resources :orders
  get "reports", to: "reports#index"
  get "about", to: "about#about1"
  get "/signin" => "sessions#new", as: :new_sessions
  post "/signin" => "sessions#create", as: :sessions
  delete "/signout" => "sessions#destroy", as: :destroy_session
  get "/" => "home#index"
end
