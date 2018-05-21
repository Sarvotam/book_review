class ProfilesController < ApplicationController
	before_action :authenticate_user!
	def index
			@profiles = current_user.books.all
		
	end
<<<<<<< HEAD
	
=======

>>>>>>> 5c0f1b5ac98db60bf7a844e39ad63b26d0490664
end
