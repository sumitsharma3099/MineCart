Rails.application.routes.draw do
  # Default root path for non-logged-in users


  # Root path for logged-in non-admin users
  authenticated :user do
    root 'stores#index', as: :user_root
  end

  # Root path for admin users
  authenticated :admin do
    root 'admins#dashboard', as: :admin_root
  end

  devise_for :users
  devise_for :admins, skip: [:registrations, :passwords]

  namespace :admin do
    resources :products, except: :show
    resources :vendors, only: :index
  end

  get '/add_product_to_cart/:id', to: 'carts#add_product', as: 'add_product_to_cart'
  get '/place_order', to: 'carts#place_order', as: 'place_order'
  resources :carts, only: [:index, :destroy]
  unauthenticated do
    root 'welcome#index'
  end
  # Route for handling unmatched paths
  match '*unmatched', to: 'application#not_found_method', via: :all
end
