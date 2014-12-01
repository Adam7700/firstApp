class ChurchesController < ApplicationController
	before_action :ensure_user_logged_in, only: [:new, :create]
	before_action :ensure_right_user, only: [:edit, :update]
	
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
		if current_user == @church.user || current_user.admin?
			@church.destroy
        	flash[:success] = "#{@church.name} removed from the site"
			redirect_to churches_path
		else
			flash[:danger] = "Not the right user"
			redirect_to root_path
		end
	end
	
	def update
		@church = Church.find(params[:id])
		@service = @church.services.all[0]
		if @church.update(church_params)
            flash[:success] = "Church updated!"
            redirect_to church_path
        else
            flash.now[:danger] = "not able to update!"
            render 'edit'
        end
	end
	
	def edit
		@church = Church.find(params[:id])	
       	rescue
		flash[:danger] = "Unable to find church"
		
		redirect_to churches_path
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
					   services_attributes: [:id,
						   		  :start_time,
							      :finish_time,
							      :location,
						   		  :day_of_week] )
    end
	
	
	def ensure_user_logged_in
		unless current_user
	    	flash[:warning] = 'Not logged in'
	    	redirect_to login_path
		end
    end
	
	def ensure_right_user
		@church = Church.find(params[:id])	
		if current_user.id != @church.user.id && !current_user.admin?
			flash[:danger] = "wrong user"
			redirect_to root_path
		end
		rescue
		flash[:danger] = "Unable to find church"
		
		redirect_to churches_path
	end
end
