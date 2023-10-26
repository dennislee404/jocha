Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "categories#index"

  resources :categories do 
    resources :products, except: [:index]
  end

  get "/menu", to: "pages#menu", as: "menu_path"
end
