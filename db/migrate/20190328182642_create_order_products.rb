class CreateOrderProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :order_products do |t|
      t.references :order, foreign_key: true
      t.float :Price
      t.integer :Quantity
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
