class SessionsController < ApplicationController

    before_action :require_logged_out!

     before_action :require_logged_in!, only: [:index, :show]

    def new
        render :new
    end

    def create
        user = User.find_by_credentials(params[:user][:email], params[:user][:password])

        if user.nil?
            flash.new[:errors] = ["Invalid credentials."]
            render :new
        else
            login_user!(user)
            redirect_to user_url(user)
        end
    end

    def destroy
        logout_user!
        flash[:success] = ['Successfully logged out.']
        redirect_to new_session_url
    end

end