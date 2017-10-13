class CreateSeats < ActiveRecord::Migration[5.0]
  def change
    create_table :seats do |t|
      t.integer :user_id
      t.integer :book_id
      t.boolean :seat_status
      t.string :row_col
      t.integer :booking_id

      t.timestamps
    end
  end
end
