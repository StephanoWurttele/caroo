class AddDoorsToCars < ActiveRecord::Migration[6.0]
  def change
    add_column :cars, :doors, :integer
  end
end
