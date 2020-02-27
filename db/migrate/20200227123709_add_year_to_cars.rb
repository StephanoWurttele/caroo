class AddYearToCars < ActiveRecord::Migration[6.0]
  def change
    add_column :cars, :year, :integer
  end
end
