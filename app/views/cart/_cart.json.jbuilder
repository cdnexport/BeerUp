json.extract! product, :id, :name, :price
json.url cart_url(product, format: :json)
