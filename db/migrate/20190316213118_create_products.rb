class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.string :description
      t.float :alcohol
      t.string :container
      t.string :country
      t.string :size
      t.string :manufacturer
      t.string :image
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
