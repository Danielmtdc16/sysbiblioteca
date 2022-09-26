class ApplicationController < ActionController::Base
    before_action :authenticate_user!

    layout :layout_user

    def layout_user
        if current_user == nil
            @layout = "applicationlogin"
        else 
            @layout = "application"
        end
    end
end
