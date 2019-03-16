class CreateStores < ActiveRecord::Migration[5.2]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :postal_code
      t.string :phone
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
