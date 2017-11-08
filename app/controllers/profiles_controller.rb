class ProfilesController < ApplicationController
   
   
   def new
       # form where a user can fill out their own profile.
       @user = User.find(params[:user_id])
       @profile = Profile.new
   end
   
   def create
       @user = User.find(params[:user_id])
       @profile = @user.build_profile(profile_params)
       if @profile.save
           flash[:success] = "profile Updated"
          redirect_to user_path( params[:user_id]) 
       else
           flash[:danger] = "something went wrong"
           render action: :new
       end
   end
   
   private
    def profile_params
       params.require(:profile).permit(:first_name, :last_name, :job_title, :phone_number, :contact_email, :description) 
    end
end