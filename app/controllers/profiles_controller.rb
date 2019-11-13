class ProfilesController < ApplicationController
   before_action :authenticate_user!
   before_action :only_current_user
    #Get to users/:user_id/profile/new 
    def new
        #Render blank profile form
        @profile = Profile.new
    end
    def create
        #POST to /users/:user_id/profile
        #Ensure we have the user
        @user = User.find(params[:user_id])
        #Create profile linked to the specific user
        @profile = @user.build_profile(profile_params)
        if @profile.save
            flash[:success]= "Profile updated!"
            redirect_to user_path(params[:user_id])
        else
            render action: :new
        end
        
    end
    
    #Get to /users/:user_id/profile/edit
    def edit
        @user = User.find(params[:user_id])
        @profile = @user.profile
    end
    
    #PUT to /users/:user_id/profile
    def update
        #Retrieve the user from the database
        @user =User.find(params[:user_id])
        #Retrieve that user's profile
        @profile = @user.profile
        #Mass assign edited profile attributes and save
        if @profile.update_attributes(profile_params)
            flash[:success]= "Profile has been updated!"
        #Rediredt user to their profile page
        redirect_to user_path(params[:user_id])
        else
            render action :edit
        end
    end
    
    
    
    private
    
    def profile_params
        params.require(:profile).permit(:first_name, :last_name, :avatar, :job_title, :phone_number, :contact_email, :description)
    end
    def only_current_user
        @user = User.find(params[:user_id])
        redirect_to(root_url) unless @user == current_user
    end    
end