class ApplicationController < ActionController::Base
  private
    def set_product
      @product = Product.find(params[:id])
    end
end
