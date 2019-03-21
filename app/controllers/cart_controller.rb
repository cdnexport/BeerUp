class CartController < ApplicationController
  before_action :initialize_session
  before_action :set_product, only: [:update, :add_to_cart]

  def index
    @carts = []
    session[:cart].each do |prodHash|
      @carts << Product.new.from_json(prodHash.to_json)
    end
    @carts
  end

  def add_to_cart
    prodJson = {
      "id": @product.id,
      "name": @product.name,
      "price": @product.price
    };
    session[:cart] << prodJson
  end

  def clear_cart
    session[:cart] = []
  end

  def remove_from_cart
    session[:cart] = session[:cart].select do |product|
      product['id'].to_i != params[:id].to_i
    end
  end

  private
    def initialize_session
      session[:cart] ||= []
    end
end
