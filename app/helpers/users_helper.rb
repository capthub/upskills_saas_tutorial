module UsersHelper
    def job_title_icon
        if @user.profile.job_title == "Engineer"
            "<i class='fa fa-wrench'></i>".html_safe
        elsif @user.profile.job_title == "Buyer"
        "<i class='fa fa-credit-card'></i>".html_safe
        elsif @user.profile.job_title == "Designer"
        "<i class='fa fa-pencil'></i>".html_safe
        end
    end   
end