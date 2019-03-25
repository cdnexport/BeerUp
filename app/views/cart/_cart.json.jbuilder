json.extract! cart, "id", "name", "price", "quantity"
json.url cart_url(cart, format: :json)
