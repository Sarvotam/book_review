class AdminController < ApplicationController
	  before_action :authenticate_admin!
  def index
  	if user_signed_in?
         @pending = current_user.books.where(book_request: false) 
        @accept = current_user.books.where(book_request: true) 
      end
  	@request = Book.all.where(book_request: false)
  end

  def update
  	@request = Book.find(params[:id])
  	 if @request.update(book_request: true) 
  	redirect_to root_path
  end
  end

  def authenticate_admin!
  	if !current_user.admin
  		redirect_to root_path
  	end
  	
  end

end
