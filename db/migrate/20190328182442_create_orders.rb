class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.date :OrderDate
      t.references :tax_rate, foreign_key: true
      t.float :Subtotal
      t.float :TaxAmount
      t.float :Total
      t.references :order_status, foreign_key: true

      t.timestamps
    end
  end
end
