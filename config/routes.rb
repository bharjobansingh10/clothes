Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :customers, controllers: { sessions: 'sessions', registrations: 'users/registrations' }

  root to: 'products#index'
  resources :products, only: [:index, :show]
  resources :categories, only: [:show]
  resource :cart, only: [:show] do
    put    :add_item
    delete :remove_item
  end

  resources :orders, only: [:create, :show]
  get 'featured', to: 'products#featured', as: "featured"
  get 'recent', to: 'products#recent', as: "recent"
  get '/about_us',  to: 'products#about_us', as: "about"
  get '/contact_us',  to: 'products#contact_us', as: "contact_us"
  get 'all_products', to: 'products#all_products', as: "all_products"
  # namespace :admin do
  #   root to: 'dashboard#show'
  #   resources :products, :categories, except: [:edit, :update, :show]
  # end
end
