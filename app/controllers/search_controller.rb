class SearchController < ApplicationController
  def search
    data = params[:data].downcase
    if params[:category].nil?
      @products = Product.where('LOWER(name) LIKE ?', "%#{data}%")
    else
      category = params[:category].to_i
      @products = Product.where('category_id = ? AND LOWER(name) LIKE ?', category, "%#{data}%")
    end
  end
end
