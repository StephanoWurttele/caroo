class ChangeDatetimeToDateInBookings < ActiveRecord::Migration[6.0]
  def change
    change_column :bookings, :initial_date, :date
    change_column :bookings, :final_date, :date
  end
end
