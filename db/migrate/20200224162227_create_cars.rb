class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.text :description
      t.boolean :available
      t.integer :price
      t.string :model
      t.string :type
      t.string :brand
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
