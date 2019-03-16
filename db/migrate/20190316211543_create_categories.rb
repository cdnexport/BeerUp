class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.integer :parent_id
      t.string :name
      t.references :parent_category, index: true
      t.timestamps
    end
  end
end