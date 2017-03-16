Rails.application.routes.draw do

  namespace :admin do
    root "admin/users#index"
    resources :users
  end

  root  "static_pages#home"
  resources :users
  get  "/login",  to: "sessions#new"
  post  "/login",  to: "sessions#create"
  delete  "/logout",  to: "sessions#destroy"
  get  "/signup",  to: "users#new"

end
