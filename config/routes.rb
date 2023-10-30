Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#index"

  resources :categories
  resources :products
  resources :variants
  resource :cart, path:'cart', only: [:show, :destroy]
  resources :cart_items, path:'items', only: [:create, :update, :destroy]

  get "/menu", to: "pages#menu", as: "menu_path"
end
