class CreateHours < ActiveRecord::Migration[5.2]
  def change
    create_table :hours do |t|
      t.references :store, foreign_key: true
      t.string :day
      t.string :open
      t.string :close

      t.timestamps
    end
  end
end
