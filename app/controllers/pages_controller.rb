class PagesController < ApplicationController
    before_action :authenticate_user!, only: [:pro]
    def home 
        @basic_plan = Plan.find(1)
        @pro_plan = Plan.find(2)
    end
    
    def about
    end
    def pro
    end
end