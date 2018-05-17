class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.integer :book_id
      t.integer :user_id
      t.integer :booked_seats

      t.timestamps
    end
  end
end
