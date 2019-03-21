ActiveAdmin.register Category do
  permit_params :name, :subcategory, :parent

end
