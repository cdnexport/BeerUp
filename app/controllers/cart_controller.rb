class CartController < ApplicationController
  before_action :initialize_session
  before_action :set_product, only: [:update, :add_to_cart]

  def index
    session[:cart]
  end

  def add_to_cart
    session[:cart] << @product
  end

  def destroy
    session[:cart] = []
  end

  private
    def initialize_session
      session[:cart] ||= []
    end
end
