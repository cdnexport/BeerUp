json.extract! cart, :id, :name, :price
json.url cart_url(cart, format: :json)
