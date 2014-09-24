class UsersController < ApplicationController    
    def index
	@users = User.all
    end

    def new
	@user = User.new
    end

    def create
	    @user = User.new(params.require(:user).permit(:name, :email, :password))
    	if @user.save
	        flash[:success] = "Welcome to the site, #{@user.name}"
	        redirect_to @user
    	else
	        flash.now[:danger] = "Unable to create new user"
	        render 'new'
	    end
    end

    def show
	    @user = User.find(params[:id])
        rescue
	    flash[:danger] = "Unable to find user"
	    redirect_to users_path
    end
    
    def edit
        @user = User.find(params[:id])
    end
    
    def update
        @user = User.find(params[:id])
        if @user.update_attributes(params.require(:user).permit(:name, :email, :password))
            flash[:success] = "Profile updated!"
            redirect_to user_path
        else
            flash[:danger] = "not able to update!"
            render 'edit'
        end
    end
 
end