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


	
end
