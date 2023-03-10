class UsersController < ApplicationController
    def index

    end

    def create
        user = User.new(user_params)

        respond_to do |format|
            if user.save()
                session[:user_id] = user.id
                format.html { redirect_to '/posts', notice: 'Successfully registered new user!' }
                format.json { render :index, status: :created, location: @user }
            else
                format.html { render :index, status: :unprocessable_entity }
                format.json { render json: @user.errors, status: :unprocessable_entity }
            end
        end
    end

    private def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
