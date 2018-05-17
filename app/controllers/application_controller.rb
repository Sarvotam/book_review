class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
 before_action :book_req
 	private
		def book_req
			if user_signed_in?
				 @pending = current_user.books.where(book_request: false) 
				@accept = current_user.books.where(book_request: true) 
			end
		end
end
