Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :home
  resources :products, :defaults => {:format => :json}
  resources :categories, :defaults => {:format => :json}
  match 'store/closest_store' => 'store#closest_store', :via => :get, :defaults => {:format => :json}
  match 'store/closest_by_ip' => 'store#closest_by_ip', :via => :get, :defaults => {:format => :json}

  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
