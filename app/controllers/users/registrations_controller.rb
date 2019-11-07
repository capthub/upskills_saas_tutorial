class Users::RegistrationsController < Devise::RegistrationsController
  before_action :select_plan, only: :new
  
  #Extend defauls Devise gem behaviour so that user signing up with Pro save with a special function
  #Otherwise Devise signs up user as usual
  def create
    super do |resource|
      if params[:plan]
        resource.plan_id = params[:plan]
        if resource.plan_id == 2
          resource.save_with_subscription
        else
          resource.save
        end
      end
    end
  end
  
  private
    def select_plan
      unless (params[:plan] == '1' || params[:plan] == '2')
      flash[:notice] = "Please select a memberships plan to sign up."
        redirect_to root_url
      end
    end
end