Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "categories#index"

  resources :categories
  resources :products
  resources :carts, only: [:index]

  get "/menu", to: "pages#menu", as: "menu_path"
end
