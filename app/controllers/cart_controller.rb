class CartController < ApplicationController
  before_action :initialize_session
  before_action :set_product, only: [:update, :add_to_cart]

  def index
    @carts = session[:cart]
    pp @carts
    @carts
  end

  def add_to_cart
    prodJson = {
      "id": @product.id,
      "name": @product.name,
      "price": @product.price,
      "quantity": 1
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

  def reduce_quantity
    session[:cart].each_with_index do |prod, index|
      if (prod['id'] == params[:id].to_i)
        prod['quantity'] = prod['quantity'].to_i - 1
        session[:cart][index] = prod
        break
      end
    end
  end

  def increase_quantity
    session[:cart].each_with_index do |prod, index|
      if (prod['id'] == params[:id].to_i)
        prod['quantity'] = prod['quantity'].to_i + 1
        session[:cart][index] = prod
        break
      end
    end
  end

  private
    def initialize_session
      session[:cart] ||= []
    end
end
