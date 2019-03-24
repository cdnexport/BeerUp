class StoreController < ApplicationController
  def closest_store
    @stores = Store.closest(origin: [params[:latitude].to_f, params[:longitude].to_f])
  end
end
