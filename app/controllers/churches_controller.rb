class ChurchesController < ApplicationController

	def index
		@churches = Church.all
	end
	
	def show
		@church = Church.find(params[:id])
		rescue
	    flash[:danger] = "Unable to find church"
		redirect_to churches_path
	end
	
	def destroy
				@church = Church.find(params[:id])	
		if current_user.church_id != @church.user_id
			flash[:danger] = "Unable to find church"
			redirect_to root_path
		end
       	rescue
	    flash[:danger] = "Unable to find church"
		
		redirect_to root
	end
	
	def update
				@church = Church.find(params[:id])	
		if current_user.church_id != @church.user_id
			flash[:danger] = "Unable to find church"
			redirect_to root_path
		end
       	rescue
	    flash[:danger] = "Unable to find church"
		
		redirect_to root
	end
	
	def edit
		@church = Church.find(params[:id])	
		if current_user.church_id != @church.user_id
			flash[:danger] = "Unable to find church"
			redirect_to root_path
		end
       	rescue
	    flash[:danger] = "Unable to find church"
		
		redirect_to root
	end
	
end
