class CreateOrderProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :order_products do |t|
      t.references :Order, foreign_key: true
      t.float :Price
      t.integer :Quantity
      t.references :Product, foreign_key: true

      t.timestamps
    end
  end
end
