class AddTransmissionToCars < ActiveRecord::Migration[6.0]
  def change
    add_column :cars, :transmission, :string
  end
end
