class ChangeTypeColumnToKind < ActiveRecord::Migration[6.0]
  def change
    rename_column :cars, :type, :kind
  end
end
