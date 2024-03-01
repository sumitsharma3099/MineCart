Rails.application.routes.draw do
  devise_for :users
  devise_for :admins, :skip => [:registrations, :passwords]

  # User routes
  authenticated :user do
    root 'stores#index', as: :user_root
  end

  # Admin routes
  authenticated :admin do
    root 'admins#dashboard', as: :admin_root
  end

  namespace :admin do
    resources :products, except: :show
    resources :vendors, only: :index
  end

  get '/add_product_to_cart/:id', to: "carts#add_product", as: "add_product_to_cart"
  get '/place_order', to: "carts#place_order", as: "place_order"
  resources :carts, only: [:index, :destroy]

  match '*unmatched', to: 'application#not_found_method', via: :all

end
