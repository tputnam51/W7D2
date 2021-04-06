class UsersController < ActionController

    def create
        @user = User.new(user_params)

        if @user.save!
            login_user!(@user)
            redirect_to user_url
        else
            render :new
        end

    end

    def new
        @user = User.new
        render :new
    end

    def user_params
        params.require(:user).permit(:email, :password)
    end
end