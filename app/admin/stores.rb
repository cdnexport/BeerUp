ActiveAdmin.register Store do
  permit_params :name, :address, :city, :postal_code, :phone, :latitude, :longitude
end
