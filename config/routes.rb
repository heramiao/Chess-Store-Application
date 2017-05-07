Rails.application.routes.draw do
  
  # Routes for main resources
  resources :items
  resources :purchases
  resources :item_prices
  resources :users
  resources :sessions
  resources :order_items
  resources :orders
  resources :schools
  resources :cart

  # Authentication routes
  get 'signup' => 'users#new', :as => :signup
  get 'login' => 'sessions#new', :as => :login
  get 'logout' => 'sessions#destroy', :as => :logout

  # Semi-static page routes
  get 'home' => 'home#home', as: :home
  get 'about' => 'home#about', as: :about
  get 'contact' => 'home#contact', as: :contact
  get 'privacy' => 'home#privacy', as: :privacy

  # More specific user routes
  get 'user/edit_current_user' => 'users#edit_current_user', :as => :edit_current_user
  get 'user/customer_index' => 'users#customer_index', :as => :customer_index
  get 'user/employee_index' => 'users#employee_index', :as => :employee_index

  # More specific item routes
  get 'item/boards' => 'items#boards', :as => :boards
  get 'item/pieces' => 'items#pieces', :as => :pieces
  get 'item/clocks' => 'items#clocks', :as => :clocks
  get 'item/supplies' => 'items#supplies', :as => :supplies
  
  # Set the root url
  root :to => 'home#home'  

end
