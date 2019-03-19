ActiveAdmin.register Product do
  permit_params :name, :price, :description, :alcohol, :country, :size, :manufacturer, :image, :category
end