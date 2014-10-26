class ServicesController < ApplicationController
	def index
		order_param = (params[:order] || :Time).to_sym
	ordering = case order_param
	when :Day
		:day_of_week
		@services = Service.all.sort{|x| x.byDay}
	when :Time
		:start_time
		@services = Service.order(ordering)
	end

    end
	
	def byDay
		if this == "sunday"
			this[0]="sunday"
		end
	end
end
