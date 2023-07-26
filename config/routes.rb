Rails.application.routes.draw do
  devise_for :customers, controllers: { sessions: 'sessions', registrations: 'users/registrations' }

  root to: 'products#index'
  resources :products, only: [:index, :show]
  resources :categories, only: [:show]
  resource :cart, only: [:show] do
    put    :add_item
    delete :remove_item
  end
  namespace :admin do
    root to: 'dashboard#show'
    resources :products, :categories, except: [:edit, :update, :show]
  end
end
