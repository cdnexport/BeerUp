json.extract! product, :id, :name, :price, :description,
  :alcohol, :country, :size, :manufacturer, :image,
  :category_id
json.url product_url(product, format: :json)
