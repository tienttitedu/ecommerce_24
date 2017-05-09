Rails.application.routes.draw do

  namespace :admin do
    root "categories#index"
    resources :users
    resources :categories
    resources :products
    resources :orders
  end

  resource :cart, only: :show
  resources :order_items, only: [:create, :update, :destroy]
  resources :orders
  resources :products do
    resources :reviews
  end

  root  "static_pages#home"
  resources :users
  get  "/login",  to: "sessions#new"
  post  "/login",  to: "sessions#create"
  delete  "/logout",  to: "sessions#destroy"
  get  "/signup",  to: "users#new"

end
