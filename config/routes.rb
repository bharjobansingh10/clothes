Rails.application.routes.draw do
  devise_for :customers, controllers: { sessions: 'sessions' }

  root to: 'products#index'
  resources :products, only: [:index, :show]
  resources :categories, only: [:show]
  resource :cart, only: [:show] do
    put    :add_item
    delete :remove_item
  end
end
