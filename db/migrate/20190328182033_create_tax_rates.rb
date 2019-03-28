class CreateTaxRates < ActiveRecord::Migration[5.2]
  def change
    create_table :tax_rates do |t|
      t.float :PST
      t.float :GST
      t.float :HST
      t.bool :Active

      t.timestamps
    end
  end
end
