class AddBookRequestToBooks < ActiveRecord::Migration[5.0]
  def change
  	  	  	add_column :books, :book_request, :boolean, default: false

  end
end
