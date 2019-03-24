# json.array! @stores, partial: 'store/store', as: :store
json.array! @stores do |store|
  json.id store.id
  json.name store.name
  json.address store.address
  json.city store.city
end