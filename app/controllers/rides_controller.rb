class RidesController < ApplicationController

	def create
		@ride = Ride.new(ride_params)
		@ride.user_id = current_user.id
		@service = Service.find(params[:service_id])
		@ride.service_id = @service.id
		if @ride.save
			flash[:success] = "Ride created"
			redirect_to @ride
    	else
			flash[:danger] = "Unable to create ride"
			redirect_to root_path
	    end
	end
	
	def index
	order_param = (params[:order] || :Date).to_sym
	@service = Service.find(params[:service_id])
	ordering = case order_param
		   when :Date
		       :date
		   when :Service
		       :service_id
		   end
		@rides = @service.rides.order(ordering)
    end
	
	def show
		@ride = Ride.find(params[:id])
		rescue
		flash[:danger] = "Unable to find ride"
		redirect_to rides_path
	end
	
	def update
		@ride = Ride.find(params[:id])
		if params[:rider]
			@ride.users = params[:rider]
			if @ride.save
				flash[:success] = "rider added!"
            	redirect_to root_path
			else
				flash[:danger] = "rider not added!"
				redirect_to root_path
			end
		end
	end
	
	private

	def ride_params
		params.require(:ride).permit(:date,
									   :leave_time, 
									   :return_time, 
									   :number_of_seats, 
									   :seats_available, 
			 						   :meeting_location, 
							   	       :vehicle)
    end
end
