class BooksController < ApplicationController

	before_action :find_book, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, only: [:new, :edit]
	before_action :authenticate_admin!, only: [:edit, :update, :destroy, :new]

	def index
		if params[:category].blank?
			@books = Book.all.order("created_at DESC")
			# stop before accepting the book by admin to show
			@books = Book.all.where(book_request: true)
			
		else
			@category_id = Category.find_by(name: params[:category]).id
			@books = Book.where(category_id: @category_id , book_request: true).order("created_at DESC")
		end

	end

	def show

		if @book.book_request == true
			if @book.reviews.blank?
				@average_review = 0
			else
				@average_review = @book.reviews.average(:rating)
			end
			@reviews = @book.reviews
		else
			redirect_to root_path
		end

	end

	def new

		@book = current_user.books.build
		@categories = Category.all.map{ |c| [c.name, c.id] }
	end

	def create
		@book = current_user.books.build(book_params)
		@book.category_id = params[:category_id]

		if @book.save
			flash[:success] = "book request sended to the admin"
			redirect_to root_path
		else
			render 'new'
		end
	end

	def edit
		@categories = Category.all.map{ |c| [c.name, c.id] }
	end

	def update
		@book.category_id = params[:category_id]
		if @book.update(book_params)
			redirect_to book_path(@book)
		else
			render 'edit'
		end
	end

	def destroy
		@book.destroy
		redirect_to root_path
	end

	private

		def book_params
			params.require(:book).permit(:title, :description, :author, :category_id, :book_img)
		end

		def find_book
			@book = Book.find(params[:id])
		end

<<<<<<< HEAD
		def authenticate_admin!
  		if !current_user.admin
  		redirect_to root_path
  		end
  	
  end
=======
>>>>>>> 5c0f1b5ac98db60bf7a844e39ad63b26d0490664
		
end
