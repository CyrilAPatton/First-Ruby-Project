class SessionsController < ApplicationController
    def create
        user = User.find_by(email:login_params[:email])
        # if user && user.authenticate(login_params[:password])
        #     session[:user_id] = user.id
        #     redirect_to '/posts'
        # else
        #     flash[:login_errors] = ['Invalid Credentials']
        #     redirect_to '/'
        # end

        respond_to do |format|
            if user && user.authenticate(login_params[:password])
                session[:user_id] = user.id
                format.html { redirect_to '/posts', notice: 'A user successfully logged in!' }
                format.json { render '/posts', status: :logged_in, location: @user }
            else
                format.html { render :index, status: :unprocessable_entity }
                format.json { render json: @user.errors, status: :unprocessable_entity }
            end
        end
    end

    private def login_params
        params.require(:login).permit(:email, :password)
    end
end
