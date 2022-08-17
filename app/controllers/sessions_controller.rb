class SessionsController < ApplicationController
    
    
    def index

    end
    
    def new

    end

    def create
       
        @user = User.find_by(email_address: params[:email])
        
        if @user && @user.authenticate(params[:password]) && @user.admin == true
            session[:user_id] = @user.id
            redirect_to bookings_path
        elsif
            @user && @user.authenticate(params[:password]) && @user.admin == false
            session[:user_id] = @user.id
            redirect_to bookings_path
        else
            redirect_to "/"
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to root_path
    end

end
