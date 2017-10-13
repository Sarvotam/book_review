class SeatsController < ApplicationController
	skip_before_filter :verify_authenticity_token, :only => :create
  def index
	  	  	# redirect_to root_path

  end

  def create
  	@seat= params[:seat]
  	@seat=@seat.split("||")
  	@seat.shift
  	# render plain: params.inspect #seat number view
    @seat.each do |x|
      
  		Seat.create!(book_id: params[:book_id] , user_id: current_user.id , row_col: x)
  	end
    redirect_to book_path(params[:book_id])
  	
  end


  def destroy
      @seat=Seat.find(params[:id])
      if @seat.user_id != current_user.id
        redirect_to root_url
        flash[:notice] = "cannot delete !!not your reserved seat"
        else
        @seat.destroy
        redirect_to root_path
        flash[:notice] = "Reserved seat cancelled"
      end
  end
  private
  def seat_params
  	
  end
end
