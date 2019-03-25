Rails.application.routes.draw do
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

  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
