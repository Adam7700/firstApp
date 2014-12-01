class RidesController < ApplicationController
    def index
	order_param = (params[:order] || :Date).to_sym
	ordering = case order_param
		   when :Date
		       :date
		   when :Service
		       :service_id
		   end
	@rides = Ride.order(ordering)
    end
	
	def show
		@ride = Ride.find(params[:id])
		rescue
		flash[:danger] = "Unable to find ride"
		redirect_to rides_path
	end
	
	
	private
	private

	def ride_params
		params.require(:church).permit(:date)
    end
end
