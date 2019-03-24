class StoreController < ApplicationController
  def closest_store
    @stores = Store.closest(origin: [params[:latitude].to_f, params[:longitude].to_f])
  end

  def closest_by_ip
    @stores = Store.within(5, origin: remote_ip())
  end
end
