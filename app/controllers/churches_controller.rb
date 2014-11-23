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
	

    def new
	@church = Church.new
	@church.services.build
    end

    def create
	@church = Church.new(church_params)
	@church.user = current_user
	if @church.save
	    flash[:success] = "Church created"
	    redirect_to @church
	else
	    flash.now[:danger] = "Unable to create church"
	    render 'new'
	end
    end

    private

    def church_params
	params.require(:church).permit(:name,
				       :web_site,
				       :description,
				       :picture,
				       services_attributes: [ :start_time,
							      :finish_time,
							      :location ] )
    end
end
