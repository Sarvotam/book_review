class Book < ApplicationRecord
	belongs_to :user
	belongs_to :category
	has_many :reviews, dependent: :destroy
	has_many :seats, dependent: :destroy
	has_many :bookings, dependent: :destroy
	enum book_catelog: [:nowshowing, :commingsoon]
	has_attached_file :book_img, :styles => { :book_index => "250x250>", :book_show => "350x475>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :book_img, content_type: /\Aimage\/.*\z/
end
