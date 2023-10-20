Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#index"

  resources :categories, only: [:new, :create, :edit, :update, :destroy] do 
    resources :products, only: [:new, :create, :edit, :update, :destroy]
  end

  get "/menu", to: "pages#menu", as: "menu_path"
end
