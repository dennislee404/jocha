Rails.application.routes.draw do
  resources :checkouts,  only: [:new, :create, :show]
  
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#index"

  resources :users, only: [:show, :edit, :update]
   
  resources :categories
  resources :products do 
    resources :product_variants
  end
  
  resources :variants do 
    resources :variant_items
  end

  resources :options do 
    resources :option_items
  end

  resource :cart, path:'cart', only: [:show, :destroy]
  resources :cart_items, path:'items', only: [:create, :update, :destroy]

  resources :orders, only: [:show, :new, :create] do 
    resources :order_items, only: [:new, :create]
  end

  resources :transactions, only: [:new, :create]

  get "/locations", to: "pages#location", as: "location"
  get "/rewards", to: "pages#reward", as: "reward"
  get "/events", to: "pages#event", as: "event"
end
