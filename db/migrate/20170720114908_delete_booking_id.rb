class DeleteBookingId < ActiveRecord::Migration[5.0]
  def change
  	remove_column :seats, :seat_status
  	remove_column :seats, :booking_id
  end
end
