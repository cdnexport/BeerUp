Rails.application.routes.draw do
  resources :home
  resources :products, :defaults => {:format => :json}

  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
