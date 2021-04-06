class UsersController < ApplicationController

    before_action :require_logged_out!

    def create
        @user = User.new(user_params)

        if @user.save!
            login_user!(@user)
            redirect_to user_url
        else
            flash.now[:errors] = user.error.full_messages
            render :new
        end
    end

    def new
        @user = User.new
        render :new
    end

    def show
      @user = User.find(params[:id])
      render :show
    end

    def user_params
        params.require(:user).permit(:email, :password)
    end
end