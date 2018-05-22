class ProfilesController < ApplicationController
	before_action :authenticate_user!
	def index
			@profiles = current_user.books.all
		
	end
end
