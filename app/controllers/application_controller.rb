class ApplicationController < ActionController::Base
    # before_action :set_user
    # before_action :authorized
    helper_method :current_user,
    
    
    
    # setting current user with user id to float around application 
    # def set_user
    #     @logged_in_user = User.find_by(id: session[:user_id])
    # end
    
    # def authorized
    #     if @logged_in_user
    #     else
    #         flash[:errors] = "Please Log In"
    #         redirect_to "/"
    #     end
    # end

    def current_user
        
        if(session[:user_id] && session[:user_id] != nil)
            return User.find(session[:user_id])
        else
          nil
        end
    end

    
 
end
