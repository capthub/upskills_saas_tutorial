class ProfilesController < ApplicationController
   
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
    
    private
    
    def profile_params
        params.require(:profile).permit(:first_name, :last_name, :avatar, :job_title, :phone_number, :contact_email, :description)
    end
end