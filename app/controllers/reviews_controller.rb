class ReviewsController < ApplicationController
	before_action :find_book
	before_action :find_review, only: [:edit, :update, :destroy]
	before_action :authenticate_user!, only: [:new, :edit]

	def new
		@review = Review.new
	end

	def create
		@review = Review.new(review_params)
		@review.book_id = @book.id
		@review.user_id = current_user.id

		respond_to do |f|
			if @review.save
				f.js
			else
				render 'new'
			end
		end
	end

	def edit
		if @review.user_id != current_user.id
			redirect_to root_url
		end
	end

	def update
		if @review.update(review_params)
			redirect_to book_path(@book)
		else
			render 'edit'
		end
	end

	def destroy
		respond_to do |f|
			if @review.destroy
				f.js
			end
			
		end
	end

	private

		def review_params
			params.require(:review).permit(:rating, :comment)
		end

		def find_book
			@book = Book.find(params[:book_id])
		end

		def find_review
			@review = Review.find(params[:id])
		end

end