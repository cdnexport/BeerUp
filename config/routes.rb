Rails.application.routes.draw do
  get 'pages/get_links'
  get 'pages/permalink'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :home
  resources :products, :defaults => {:format => :json}
  resources :categories, :defaults => {:format => :json}
  resources :cart, :defaults => {:format => :json}, only: [:index, :destroy] do
    member do
      post :add_to_cart
      post :increase_quantity
      delete :remove_from_cart
      delete :reduce_quantity
    end
    collection do
      post :clear_cart
    end
  end
  match 'store/closest_store' => 'store#closest_store', :via => :get, :defaults => {:format => :json}
  match 'store/closest_by_ip' => 'store#closest_by_ip', :via => :get, :defaults => {:format => :json}
  match 'pages/:permalink', to: 'pages#permalink', as: 'permalink', :via => :get, :defaults => {:format => :json}
  match 'pages/get_links', to: 'pages#get_links', as: 'links', :via => :get, :defaults => {:format => :json}

  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
