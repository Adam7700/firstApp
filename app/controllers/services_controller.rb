class ServicesController < ApplicationController
	def index
		order_param = (params[:order] || :Time).to_sym
		ordering = case order_param
		when :Day
			:day_of_week
		when :Time
			:start_time
		
		end
		if (ordering == :day_of_week)
			a1=["Sunday", "Monday","Tuesday","Wednesday","Thursday","Friday","Saturday", nil]
			@services = Service.all.sort_by{|x| a1.index(x.day_of_week)}
		else
			@services = Service.order(ordering)
		end
    end

	def show
		@service = Service.find(params[:id])
        rescue
		flash[:danger] = "Unable to find service"
	    redirect_to root_path
	end
	
	def new
		@service = Service.new
	end
	
	def update
		@service = Service.find(params[:id])
		if params[:newRide]
			@service.church_id = params[:newRide]
			if @service.save
				flash[:success] = "ride added!"
            	redirect_to root_path
			else
				flash[:danger] = "did not add ride!"
				redirect_to root_path
			end
		end
	end
	
	private
	def service_params
		params.require(:service).permit(:date)
    end
end
