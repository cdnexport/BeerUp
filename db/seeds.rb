Hour.destroy_all
Store.destroy_all

url = 'http://ontariobeerapi.ca/stores/'
storesResponse = Net::HTTP.get(URI(url))
storesJson = JSON.parse(storesResponse)

storesJson.each do |store|
  newStore = Store.create(
    id: store["store_id"],
    name: store["name"],
    address: store["address"],
    city: store["city"],
    postal_code: store["postal_code"],
    phone: store["phone"],
    latitude: store["latitude"],
    longitude: store["longitude"]
  )
  newStore.hours.create(
    day: "Monday",
    open: store["monday_open"],
    close: store["monday_close"]
  )
  newStore.hours.create(
    day: "Tuesday",
    open: store["tuesday_open"],
    close: store["tuesday_close"]
  )
  newStore.hours.create(
    day: "Wednesday",
    open: store["wednesday_open"],
    close: store["wednesday_close"]
  )
  newStore.hours.create(
    day: "Thursday",
    open: store["thursday_open"],
    close: store["thursday_close"]
  )
  newStore.hours.create(
    day: "Friday",
    open: store["friday_open"],
    close: store["friday_close"]
  )
  newStore.hours.create(
    day: "Saturday",
    open: store["saturday_open"],
    close: store["saturday_close"]
  )
  newStore.hours.create(
    day: "Sunday",
    open: store["sunday_open"],
    close: store["sunday_close"]
  )
end
