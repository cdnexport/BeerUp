class ApplicationController < ActionController::Base
  def remote_ip
    if request.remote_ip == '127.0.0.1'
      '192.206.151.131'
    else
      request.remote_ip
    end
  end
  private
    def set_product
      @product = Product.find(params[:id])
    end
end
