class AdminController < ApplicationController
	  before_action :authenticate_admin!
  def index
  	
  	@request = Book.all.where(book_request: false)
  end

  def update
  	@request = Book.find(params[:id])
  	 if@request.update(book_request: true)
  	redirect_to root_path
  end
  end

  def authenticate_admin!
  	if !current_user.admin
  		redirect_to root_path
  	end
  	
  end

end
